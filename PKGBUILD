# Maintainer: Fabio Fontana (fabifont) <me@fabifont.dev>

_pkgname="flatten"
pkgname="${_pkgname}-bin"
pkgver=0.2.0
pkgrel=1
pkgdesc="Prebuilt binary for flatten, a Rust CLI for exporting project trees"
arch=("x86_64")
url="https://github.com/fabifont/flatten"
license=("MIT" "Apache-2.0")

depends=("gcc-libs")

provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}" "${_pkgname}-git")

_target="${CARCH}-unknown-linux-gnu"
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver//_/-}/${_pkgname}-${_target}.tar.gz")
# The AUR workflow replaces SKIP with fixed checksums before publishing.
sha256sums=('b1a250daa1378d59c61ba19fc06c7aeb0a8613110491bffb9b9afd5f00329e39')
b2sums=('fb78d7dec6c126fd2e4047cc4b5b3b55b54730b6390ee5ec3b79b72573fa0dd8663c39378986c3c5cfacbc0e489d9da20b3fdd8f1b15bf11cfae0c1b770adb38')

package() {
  cd "${_pkgname}-${_target}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "LICENSE-MIT" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-MIT"
  install -Dm644 "LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-APACHE"
}

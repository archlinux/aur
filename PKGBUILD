# Maintainer: Afroz Saqlain <sqn3680@gmail.com>
pkgname=papr-bin
_pkgname=papr
_crate_name=papr-tui
pkgver=0.1.2
pkgrel=1
pkgdesc="A keyboard-first terminal workspace for academic papers"
arch=("x86_64")
url="https://github.com/AfrozSaqlain/Papr"
license=("MIT")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${_crate_name}-${pkgver}-x86_64-unknown-linux-gnu.tar.gz::${url}/releases/download/v${pkgver}/${_crate_name}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=("599fa54d09f9f6a509830603b866de58d4a87e14c0ef7e4ce8a6f2f7fab2d046")

package() {
  find "${srcdir}" -type f -name "${_pkgname}" -exec install -Dm755 {} "${pkgdir}/usr/bin/${_pkgname}" \;
  find "${srcdir}" -type f -name "LICENSE*" -exec install -Dm644 {} "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE" \;
}

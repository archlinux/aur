# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="drand"
pkgname="${_pkgname}-bin"
pkgver=2.0.6
pkgrel=1
pkgdesc="A Distributed Randomness Beacon Daemon"
arch=('aarch64' 'i686' 'x86_64')
url="https://drand.love"
_url="https://github.com/${_pkgname}/${_pkgname}"
license=('Apache-2.0 OR MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_arm64.tar.gz")
source_i686=("${_pkgsrc}-i686.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_386.tar.gz")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_amd64.tar.gz")
sha256sums_aarch64=('f7e2f0e6035205b8e725b9de9d8f3c6200c452dbe1fc47b712d89314cb0a4e67')
sha256sums_i686=('d291a602a79c960c51b43e80b87b90bf53811e6506230909aefe1169eab1bd57')
sha256sums_x86_64=('2cd9311287f85372d4e6da872e58ef42d4a172713c44691ca22f523b5df42ac5')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}"    "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"      "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-APACHE-2.0"
  install -vDm644 "LICENSE-MIT"    "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-MIT"
}

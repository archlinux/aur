# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="drand"
pkgname="${_pkgname}-bin"
pkgver=2.1.2
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
sha256sums_aarch64=('cdcf68e08f654eebbcb62bf257c29e18e0825bc4d2a926858be566950644dbd0')
sha256sums_i686=('cc974d6ac2bd576015a7f9a5682e5bf778784e954283cfe90703e04cf58ac101')
sha256sums_x86_64=('6ea7712703fd0e8a420a3d4fc092dbd8959280569cb4ae4c43e13b54a425b8aa')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}"    "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"      "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-APACHE-2.0"
  install -vDm644 "LICENSE-MIT"    "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-MIT"
}

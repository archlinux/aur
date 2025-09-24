# Maintainer: <reg-archlinux AT klein DOT tuxli DOT ch> 

_pkgname=rssnix
pkgname="${_pkgname}-bin"
pkgver=0.4.1
pkgrel=1
pkgdesc="Unix-style filesystem-based RSS/Atom/JSON Feed fetcher/reader"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/jafarlihi/rssnix"
license=('MIT')
optdepends=('vim: default viewer'
						'ranger: enhanced viewer')
provides=("${_pkgname}")
conflicts=("${_pkgname}-git" "${_pkgname}")
source_x86_64=(${_pkgname}-x64_${pkgver}.tar.gz::https://github.com/jafarlihi/rssnix/releases/download/${pkgver}/rssnix_${pkgver}_linux_amd64.tar.gz)
source_aarch64=(${_pkgname}_arm64_${pkgver}.tar.gz::https://github.com/jafarlihi/rssnix/releases/download/${pkgver}/rssnix_${pkgver}_linux_arm64.tar.gz)
source_i686=(${_pkgname}_386_${pkgver}.tar.gz::https://github.com/jafarlihi/rssnix/releases/download/${pkgver}/rssnix_${pkgver}_linux_386.tar.gz)
sha256sums_x86_64=('e4b5dd70a917737e0824816b767df80b5e142624260cedd4931d09a34d95d458')
sha256sums_i686=('9cb908a4d3d54ff77b27568a9e24546546c252caf5c4cbe3233c4bafce3818f8')
sha256sums_aarch64=('936eedb65ba83b1a6277e62f524f00553e56ed1ccac83d6b8b02a35ff374d79a')

package() {
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm755 "${_pkgname}" "${pkgdir}"/usr/bin/"${_pkgname}"
  install -Dm644 README.md "${pkgdir}"/usr/share/doc/"${_pkgname}"/README.md
}

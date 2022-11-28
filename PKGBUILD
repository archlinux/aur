# Maintainer: <reg-archlinux AT klein DOT tuxli DOT ch> 

_pkgname=rssnix
pkgname="${_pkgname}-bin"
pkgver=0.2.2
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
sha256sums_x86_64=('28088d02d94a9f0ec626fc04364ecfc90c29adad941e9575b1bd74d72480e1f6')
sha256sums_aarch64=('f2232028bc7e8eac2af9a92449a43747b23e8960f61947557ef6960e9b967ade')
sha256sums_i686=('91af2b5572f9e525d288912538957b6ce0a7b7a09207c8ac2e1460126dfacd52')

package() {
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm755 "${_pkgname}" "${pkgdir}"/usr/bin/"${_pkgname}"
  install -Dm644 README.md "${pkgdir}"/usr/share/doc/"${_pkgname}"/README.md
}

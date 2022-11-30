# Maintainer: <reg-archlinux AT klein DOT tuxli DOT ch> 

_pkgname=rssnix
pkgname="${_pkgname}-bin"
pkgver=0.3.0
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
sha256sums_x86_64=('560b76182fd5569f4638020d4e7394c829f2aeb3e0e199d56eca9ea611edb7a7')
sha256sums_aarch64=('52bf09e09fb0c09607ed22eb521274e2380b8113cb614cb607ecabe22365d713')
sha256sums_i686=('1b4fec716b21dca254bbd7537c85c73be8c380b861c2a52bc9979ee1bfe707b7')

package() {
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm755 "${_pkgname}" "${pkgdir}"/usr/bin/"${_pkgname}"
  install -Dm644 README.md "${pkgdir}"/usr/share/doc/"${_pkgname}"/README.md
}

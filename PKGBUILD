# Maintainer: <reg-archlinux AT klein DOT tuxli DOT ch> 

_pkgname=rssnix
pkgname="${_pkgname}-bin"
pkgver=0.2.1
pkgrel=1
pkgdesc="Unix-style filesystem-based RSS/Atom/JSON Feed fetcher/reader"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/jafarlihi/rssnix"
license=('MIT')
optdepends=('vim: default viewer'
						'ranger: enhanced viewer')
provides=("${_pkgname}")
conflicts=("${_pkgname}-git" "${_pkgname}")
source_x86_64=(${_pkgname}-x64_${pkgver}.tar.gz::https://github.com/jafarlihi/rssnix/releases/download/0.2.1/rssnix_${pkgver}_linux_amd64.tar.gz)
source_aarch64=(${_pkgname}_arm64_${pkgver}.tar.gz::https://github.com/jafarlihi/rssnix/releases/download/0.2.1/rssnix_${pkgver}_linux_arm64.tar.gz)
source_i686=(${_pkgname}_386_${pkgver}.tar.gz::https://github.com/jafarlihi/rssnix/releases/download/0.2.1/rssnix_${pkgver}_linux_386.tar.gz)
sha256sums_x86_64=('7657a0c6d9ea501fc5b1c759f26ec75023518f19d475a8443785da64957d1c02')
sha256sums_aarch64=('52ea3673a6621f63e2351d1872971b40567aac81d1e8caeb8b2cbb1d9b99322b')
sha256sums_i686=('4b8e8858a4a8e36a4e16d28bf8d1a3b19ce139006f5754eaf774a42b4f3b76bb')

package() {
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm755 "${_pkgname}" "${pkgdir}"/usr/bin/"${_pkgname}"
  install -Dm644 README.md "${pkgdir}"/usr/share/doc/"${_pkgname}"/README.md
}

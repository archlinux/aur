# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Jared Meeker <jared[at]meekers[dot]org>
# Contributor: Dimitris Kiziridis <ragouel[at]outlook[dot]com>

pkgname=dnote-cli-bin
_pkgname="${pkgname%-bin}"
_shortname="${_pkgname%-cli}"
pkgver=0.16.0
pkgrel=1
pkgdesc="A simple command line notebook for programmers"
arch=('x86_64' 'aarch64')
url="https://www.getdnote.com/"
license=('GPL-3.0-only')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc')
source_x86_64=("https://github.com/${_shortname}/${_shortname}/releases/download/cli-v${pkgver}/${_shortname}_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/${_shortname}/${_shortname}/releases/download/cli-v${pkgver}/${_shortname}_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('a81ce7c5d8aface2272ceded700ba8524bc5c2e7457d751b5aa5a831611075d6')
sha256sums_aarch64=('8f56d2a9c93e9dcd2f4b9f8a3f747f9689983abb4ba7ba331d364f8fca1d6680')

package() {
	install -Dm 755 "${_shortname}" "${pkgdir}/usr/bin/${_shortname}"
	install -Dm 644 "README.md" "${pkgdir}/usr/share/doc/${_shortname}/README.md"
}

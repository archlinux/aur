# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Jared Meeker <jared[at]meekers[dot]org>
# Contributor: Dimitris Kiziridis <ragouel[at]outlook[dot]com>

pkgname=dnote-cli-bin
_pkgname="${pkgname%-bin}"
_shortname="${_pkgname%-cli}"
pkgver=0.15.4
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
sha256sums_x86_64=('fd7d0ab52dd6d1c603c095669c2015012f656ac3fe7fa603226895a3361e45c1')
sha256sums_aarch64=('a18903f758861470c1567538ac1ef3e173dd04169a780cb0ef6cb40ae5891f66')

package() {
	install -Dm 755 "${_shortname}" "${pkgdir}/usr/bin/${_shortname}"
	install -Dm 644 "README.md" "${pkgdir}/usr/share/doc/${_shortname}/README.md"
}

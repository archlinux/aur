# Maintainer: nl6720 <nl6720@gmail.com>

pkgname=mediawiki-extension-titlekey
pkgver=REL1_33.r180.g8ef4b06
pkgrel=1
_mw='REL1_33'
_commit='8ef4b0699be769d37db812e39718510efbba36e6'
pkgdesc='An extension for MediaWiki that provides a case-insensitive page title prefix search'
arch=('any')
url='https://www.mediawiki.org/wiki/Extension:TitleKey'
license=('GPL')
makedepends=('git')
source=("git+https://gerrit.wikimedia.org/r/mediawiki/extensions/TitleKey.git#commit=${_commit}")
sha512sums=('SKIP')

pkgver() {
	cd "${srcdir}/TitleKey"
	printf '%s.r%s.g%s' "${_mw}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	install -d -m755 "${pkgdir}/usr/share/webapps/mediawiki/extensions"
	cp -r "${srcdir}/TitleKey" "${pkgdir}/usr/share/webapps/mediawiki/extensions/"
}

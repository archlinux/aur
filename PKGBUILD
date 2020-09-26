# Maintainer: nl6720 <nl6720@archlinux.org>

pkgname=mediawiki-extension-titlekey
pkgver=REL1_35+r209+g2047a35
pkgrel=1
_mw='REL1_35'
_commit='2047a3586e3173f8924b278a16d36a4d54a3b1cc'
pkgdesc='An extension for MediaWiki that provides a case-insensitive page title prefix search'
arch=('any')
url='https://www.mediawiki.org/wiki/Extension:TitleKey'
license=('GPL')
makedepends=('git')
source=("git+https://gerrit.wikimedia.org/r/mediawiki/extensions/TitleKey.git#commit=${_commit}")
sha512sums=('SKIP')

pkgver() {
	cd "${srcdir}/TitleKey"
	printf '%s+r%s+g%s' "${_mw}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	install -d -m755 "${pkgdir}/usr/share/webapps/mediawiki/extensions"
	cp -r "${srcdir}/TitleKey" "${pkgdir}/usr/share/webapps/mediawiki/extensions/"
}

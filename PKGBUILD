# Maintainer: nl6720 <nl6720@archlinux.org>

pkgname=mediawiki-extension-titlekey
pkgver=1.41+r243+gcf26918
pkgrel=1
_mw='1.41'
_commit='cf26918c4252f8e43c6c5944dfcdd392ef37a13a' # git rev-parse "REL${_mw/./_}"
pkgdesc='An extension for MediaWiki that provides a case-insensitive page title prefix search'
arch=('any')
url='https://www.mediawiki.org/wiki/Extension:TitleKey'
license=('GPL-2.0-or-later')
makedepends=('git')
source=("git+https://gerrit.wikimedia.org/r/mediawiki/extensions/TitleKey.git#commit=${_commit}")
sha512sums=('SKIP')

pkgver() {
	cd "${srcdir}/TitleKey"
	printf '%s+r%s+g%s' "${_mw}" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
	install -d -m755 "${pkgdir}/usr/share/webapps/mediawiki/extensions"
	cp -r "${srcdir}/TitleKey" "${pkgdir}/usr/share/webapps/mediawiki/extensions/"
}

# Maintainer: nl6720 <nl6720@archlinux.org>

pkgname=mediawiki-extension-titlekey
pkgver=1.40+r240+g69d64c9
pkgrel=1
_mw='1.40'
_commit='69d64c993146f13c24aed02d668d71b91229d9a1' # git rev-parse "REL${_mw/./_}"
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

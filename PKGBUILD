# Maintainer: nl6720 <nl6720@archlinux.org>

pkgname=mediawiki-extension-titlekey
pkgver=1.44+r268+gefc488c
pkgrel=1
_mw='1.44'
_commit='efc488c3ed8306eda44ae338db26292e98c445f8' # git rev-parse "REL${_mw/./_}"
pkgdesc='An extension for MediaWiki that provides a case-insensitive page title prefix search'
arch=('any')
url='https://www.mediawiki.org/wiki/Extension:TitleKey'
license=('GPL-2.0-or-later')
makedepends=('git')
source=("git+https://gerrit.wikimedia.org/r/mediawiki/extensions/TitleKey.git#commit=${_commit}")
sha512sums=('46040481ecaa632df4c5ed619d24590e5e96d28e7b6f96bc1cc0ba17d9d59e66072ae98ffb34f92a1a98c6b575c5310e4a83954eca47063a4f581e1727c8409b')

pkgver() {
	cd "${srcdir}/TitleKey"
	printf '%s+r%s+g%s' "${_mw}" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
	install -d -m755 "${pkgdir}/usr/share/webapps/mediawiki/extensions"
	cp -r "${srcdir}/TitleKey" "${pkgdir}/usr/share/webapps/mediawiki/extensions/"
}

# Maintainer: nl6720 <nl6720@archlinux.org>

pkgname=mediawiki-extension-codemirror
pkgver=1.37+r741+gcb59f357
pkgrel=1
_mw='1.37'
_commit='cb59f3576a68451133df0856da872b00ed0154cd' # git rev-parse "REL${_mw/./_}"
pkgdesc='An extension for MediaWiki that provides syntax highlighting in the wikitext editor'
arch=('any')
url='https://www.mediawiki.org/wiki/Extension:CodeMirror'
license=('GPL')
makedepends=('git')
source=("git+https://gerrit.wikimedia.org/r/mediawiki/extensions/CodeMirror.git#commit=${_commit}")
sha512sums=('SKIP')

pkgver() {
	cd "${srcdir}/CodeMirror"
	printf '%s+r%s+g%s' "${_mw}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	install -d -m755 "${pkgdir}/usr/share/webapps/mediawiki/extensions"
	cp -r "${srcdir}/CodeMirror" "${pkgdir}/usr/share/webapps/mediawiki/extensions/"
}

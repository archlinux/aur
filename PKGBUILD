# Maintainer: nl6720 <nl6720@archlinux.org>

pkgname=mediawiki-extension-codemirror
pkgver=1.45+r1649+g2e253c0
pkgrel=1
_mw='1.45'
_commit='2e253c07e0fa8d6113a29267a0e6bb50ccad04e2' # git rev-parse "REL${_mw/./_}"
pkgdesc='An extension for MediaWiki that provides syntax highlighting in the wikitext editor'
arch=('any')
url='https://www.mediawiki.org/wiki/Extension:CodeMirror'
license=('GPL-2.0-or-later')
makedepends=('git')
source=("git+https://gerrit.wikimedia.org/r/mediawiki/extensions/CodeMirror.git#commit=${_commit}")
sha512sums=('46f442fb1752623f2d1d6d59d299bada1db300c0313913e31dc0c9faeff291964decefb694012754f17c0f145b6dd435661a344dcd8edbf6fac97c110f5bb1a4')

pkgver() {
	cd "${srcdir}/CodeMirror"
	printf '%s+r%s+g%s' "${_mw}" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
	install -d -m755 "${pkgdir}/usr/share/webapps/mediawiki/extensions"
	cp -r "${srcdir}/CodeMirror" "${pkgdir}/usr/share/webapps/mediawiki/extensions/"
}

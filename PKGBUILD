# Maintainer: nl6720 <nl6720@archlinux.org>

pkgname=mediawiki-extension-codemirror
pkgver=1.44+r1466+g1207e32
pkgrel=1
_mw='1.44'
_commit='1207e32d177fecb28701efd94f3ed0b0686c7ea1' # git rev-parse "REL${_mw/./_}"
pkgdesc='An extension for MediaWiki that provides syntax highlighting in the wikitext editor'
arch=('any')
url='https://www.mediawiki.org/wiki/Extension:CodeMirror'
license=('GPL-2.0-or-later')
makedepends=('git')
source=("git+https://gerrit.wikimedia.org/r/mediawiki/extensions/CodeMirror.git#commit=${_commit}")
sha512sums=('a98edc1ac92e083ffd6cd4d45556efcc0f27de470dcafb9cf6d4cb073b7263715ac42beccccd2ed7c47a1ac7d8a3cfe4cfb5c5bb543a7c80f523c2745c71112b')

pkgver() {
	cd "${srcdir}/CodeMirror"
	printf '%s+r%s+g%s' "${_mw}" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
	install -d -m755 "${pkgdir}/usr/share/webapps/mediawiki/extensions"
	cp -r "${srcdir}/CodeMirror" "${pkgdir}/usr/share/webapps/mediawiki/extensions/"
}

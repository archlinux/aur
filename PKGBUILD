# Maintainer: nl6720 <nl6720@archlinux.org>

pkgname=mediawiki-extension-codemirror
pkgver=1.42+r1066+g77850cc
pkgrel=1
_mw='1.42'
_commit='77850cc74976d1569193ec304cbd79dc8decddba' # git rev-parse "REL${_mw/./_}"
pkgdesc='An extension for MediaWiki that provides syntax highlighting in the wikitext editor'
arch=('any')
url='https://www.mediawiki.org/wiki/Extension:CodeMirror'
license=('GPL-2.0-or-later')
makedepends=('git')
source=("git+https://gerrit.wikimedia.org/r/mediawiki/extensions/CodeMirror.git#commit=${_commit}")
sha512sums=('3626c3b3d9513862d763a57c8c2f712550bc2b1def57b4f8bf5e4cc92947dbfd517c7d7d09528f5e38b3419aeeda6cc22eb23b0b785f3ac2fd0f2ab21b686a9b')

pkgver() {
	cd "${srcdir}/CodeMirror"
	printf '%s+r%s+g%s' "${_mw}" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
	install -d -m755 "${pkgdir}/usr/share/webapps/mediawiki/extensions"
	cp -r "${srcdir}/CodeMirror" "${pkgdir}/usr/share/webapps/mediawiki/extensions/"
}

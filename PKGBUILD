# Maintainer: nl6720 <nl6720@archlinux.org>

pkgname=mediawiki-extension-usermerge
pkgver=1.37+r1053+gf8306f2
pkgrel=1
_mw='1.37'
_commit='f8306f291fe86d5b9ade1e0a2aea748eb0d9e341' # git rev-parse "REL${_mw/./_}"
pkgdesc="An extension for MediaWiki that allows to merge one Wiki user's account with another Wiki user's account"
arch=('any')
url='https://www.mediawiki.org/wiki/Extension:UserMerge'
license=('GPL')
makedepends=('git')
source=("git+https://gerrit.wikimedia.org/r/mediawiki/extensions/UserMerge.git#commit=${_commit}")
sha512sums=('SKIP')

pkgver() {
	cd "${srcdir}/UserMerge"
	printf '%s+r%s+g%s' "${_mw}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	install -d -m755 "${pkgdir}/usr/share/webapps/mediawiki/extensions"
	cp -r "${srcdir}/UserMerge" "${pkgdir}/usr/share/webapps/mediawiki/extensions/"
}

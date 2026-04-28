# Maintainer: nl6720 <nl6720@archlinux.org>

pkgname=mediawiki-extension-usermerge
pkgver=1.45+r1229+g437c211
pkgrel=1
_mw='1.45'
_commit='437c2119d8de6dc5e83925d81cf3ac50d43406b2' # git rev-parse "REL${_mw/./_}"
pkgdesc="An extension for MediaWiki that allows to merge one Wiki user's account with another Wiki user's account"
arch=('any')
url='https://www.mediawiki.org/wiki/Extension:UserMerge'
license=('GPL-2.0-or-later')
makedepends=('git')
source=("git+https://gerrit.wikimedia.org/r/mediawiki/extensions/UserMerge.git#commit=${_commit}")
sha512sums=('5ed8f22cfdcaa6032b7f9535cdb576bbe4c7ea4d0e10143c4cc0bf6e4fd8f61ead33a72b2ba35b6f30f898f0e04ef8bb1439525654371e9fc07081c95d007724')

pkgver() {
	cd "${srcdir}/UserMerge"
	printf '%s+r%s+g%s' "${_mw}" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
	install -d -m755 "${pkgdir}/usr/share/webapps/mediawiki/extensions"
	cp -r "${srcdir}/UserMerge" "${pkgdir}/usr/share/webapps/mediawiki/extensions/"
}

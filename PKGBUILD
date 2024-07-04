# Maintainer: nl6720 <nl6720@archlinux.org>

pkgname=mediawiki-extension-usermerge
pkgver=1.42+r1145+g481e9aa
pkgrel=1
_mw='1.42'
_commit='481e9aa2a96a896f6d864cf63eea1cda86d9ecc1' # git rev-parse "REL${_mw/./_}"
pkgdesc="An extension for MediaWiki that allows to merge one Wiki user's account with another Wiki user's account"
arch=('any')
url='https://www.mediawiki.org/wiki/Extension:UserMerge'
license=('GPL-2.0-or-later')
makedepends=('git')
source=("git+https://gerrit.wikimedia.org/r/mediawiki/extensions/UserMerge.git#commit=${_commit}")
sha512sums=('bd58dbbf42949edbf35cc3415179f13be4dbc50287da6a90b9cf6cadbb3846a46569301f2258a7658a2604db67537c9cb4a86dca8e8fe9765efdf7da19613e8d')

pkgver() {
	cd "${srcdir}/UserMerge"
	printf '%s+r%s+g%s' "${_mw}" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
	install -d -m755 "${pkgdir}/usr/share/webapps/mediawiki/extensions"
	cp -r "${srcdir}/UserMerge" "${pkgdir}/usr/share/webapps/mediawiki/extensions/"
}

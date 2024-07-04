# Maintainer: nl6720 <nl6720@archlinux.org>

pkgname=mediawiki-extension-checkuser
pkgver=1.42+r4687+gbcf141d
pkgrel=1
_mw='1.42'
_commit='bcf141d0e8dcc0f5b932e85b84c5d42138f3dfb0' # git rev-parse "REL${_mw/./_}"
pkgdesc='An extension for MediaWiki that allows a user to check which IPs are used by a given username and which usernames are used by a given IP'
arch=('any')
url='https://www.mediawiki.org/wiki/Extension:CheckUser'

license=('GPL-2.0-or-later')
makedepends=('git')
source=("git+https://gerrit.wikimedia.org/r/mediawiki/extensions/CheckUser.git#commit=${_commit}")
sha512sums=('7d7a514221bb98d0d8d818ed0b3e2fa3d03204f442a39b5a5bb9f1d10984a45400db1eb6bf8ec9444b6f2027310683fe3a4ef4486e8dd51c153f4d21cfc2534c')

pkgver() {
	cd "${srcdir}/CheckUser"
	printf '%s+r%s+g%s' "${_mw}" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
	install -d -m755 "${pkgdir}/usr/share/webapps/mediawiki/extensions"
	cp -r "${srcdir}/CheckUser" "${pkgdir}/usr/share/webapps/mediawiki/extensions/"
}

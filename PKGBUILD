# Maintainer: nl6720 <nl6720@archlinux.org>

pkgname=mediawiki-extension-checkuser
pkgver=1.39+r3647+gf78613d0e
pkgrel=1
_mw='1.39'
_commit='f78613d0e591146ca277902a55169f58db5d00d6' # git rev-parse "REL${_mw/./_}"
pkgdesc='An extension for MediaWiki that allows a user to check which IPs are used by a given username and which usernames are used by a given IP'
arch=('any')
url='https://www.mediawiki.org/wiki/Extension:CheckUser'

license=('GPL')
makedepends=('git')
source=("git+https://gerrit.wikimedia.org/r/mediawiki/extensions/CheckUser.git#commit=${_commit}")
sha512sums=('SKIP')

pkgver() {
	cd "${srcdir}/CheckUser"
	printf '%s+r%s+g%s' "${_mw}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	install -d -m755 "${pkgdir}/usr/share/webapps/mediawiki/extensions"
	cp -r "${srcdir}/CheckUser" "${pkgdir}/usr/share/webapps/mediawiki/extensions/"
}

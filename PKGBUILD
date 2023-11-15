# Maintainer: nl6720 <nl6720@archlinux.org>

pkgname=mediawiki-extension-checkuser
pkgver=1.40+r3970+g4d861d9
pkgrel=1
_mw='1.40'
_commit='4d861d9cd1f926553b530d8d9063f3d23107dbab' # git rev-parse "REL${_mw/./_}"
pkgdesc='An extension for MediaWiki that allows a user to check which IPs are used by a given username and which usernames are used by a given IP'
arch=('any')
url='https://www.mediawiki.org/wiki/Extension:CheckUser'

license=('GPL-2.0-or-later')
makedepends=('git')
source=("git+https://gerrit.wikimedia.org/r/mediawiki/extensions/CheckUser.git#commit=${_commit}")
sha512sums=('SKIP')

pkgver() {
	cd "${srcdir}/CheckUser"
	printf '%s+r%s+g%s' "${_mw}" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
	install -d -m755 "${pkgdir}/usr/share/webapps/mediawiki/extensions"
	cp -r "${srcdir}/CheckUser" "${pkgdir}/usr/share/webapps/mediawiki/extensions/"
}

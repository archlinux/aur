# Maintainer: nl6720 <nl6720@archlinux.org>

pkgname=mediawiki-extension-lockdown
pkgver=1.37+r180+g5d8ea76
pkgrel=1
_mw='1.37'
_commit='5d8ea768991891f943f6a75f91fbc65707d2b9d0' # git rev-parse "REL${_mw/./_}"
pkgdesc='An extension for MediaWiki that implements a way to restrict access to specific namespaces and special pages to a given set of user groups'
arch=('any')
url='https://www.mediawiki.org/wiki/Extension:Lockdown'
license=('GPL')
makedepends=('git')
source=("git+https://gerrit.wikimedia.org/r/mediawiki/extensions/Lockdown.git#commit=${_commit}")
sha512sums=('SKIP')

pkgver() {
	cd "${srcdir}/Lockdown"
	printf '%s+r%s+g%s' "${_mw}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	install -d -m755 "${pkgdir}/usr/share/webapps/mediawiki/extensions"
	cp -r "${srcdir}/Lockdown" "${pkgdir}/usr/share/webapps/mediawiki/extensions/"
}

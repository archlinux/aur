# Maintainer: nl6720 <nl6720@gmail.com>

pkgname=mediawiki-extension-lockdown
pkgver=REL1_34+r145+g0aac342
pkgrel=1
_mw='REL1_34'
_commit='0aac342ad4fe02b6561f974eae7e872eaa0d2aee'
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

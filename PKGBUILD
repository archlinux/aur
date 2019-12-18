# Maintainer: nl6720 <nl6720@gmail.com>

pkgname=mediawiki-extension-lockdown
pkgver=REL1_33.r141.g9117e2f
pkgrel=1
_mw='REL1_33'
_commit='9117e2f0357ead44ab37590d6d7b1d311be31bdf'
pkgdesc='An extension for MediaWiki that implements a way to restrict access to specific namespaces and special pages to a given set of user groups'
arch=('any')
url='https://www.mediawiki.org/wiki/Extension:Lockdown'
license=('GPL')
makedepends=('git')
source=("git+https://gerrit.wikimedia.org/r/mediawiki/extensions/Lockdown.git#commit=${_commit}")
sha512sums=('SKIP')

pkgver() {
	cd "${srcdir}/Lockdown"
	printf '%s.r%s.g%s' "${_mw}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	install -d -m755 "${pkgdir}/usr/share/webapps/mediawiki/extensions"
	cp -r "${srcdir}/Lockdown" "${pkgdir}/usr/share/webapps/mediawiki/extensions/"
}

# Maintainer: nl6720 <nl6720@gmail.com>

pkgname=mediawiki-extension-abusefilter
pkgver=REL1_33.r4729.ge054f2e0c
pkgrel=1
_mw='REL1_33'
_commit='e054f2e0c49202c6735f19f0a1b179ebf1b639eb'
pkgdesc='An extension for MediaWiki that allows privileged users to set specific actions to be taken when actions by users, such as edits, match certain criteria'
arch=('any')
url='https://www.mediawiki.org/wiki/Extension:AbuseFilter'
license=('GPL')
makedepends=('git')
source=("git+https://gerrit.wikimedia.org/r/mediawiki/extensions/AbuseFilter.git#commit=${_commit}")
sha512sums=('SKIP')

pkgver() {
	cd "${srcdir}/AbuseFilter"
	printf '%s.r%s.g%s' "${_mw}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	install -d -m755 "${pkgdir}/usr/share/webapps/mediawiki/extensions"
	cp -r "${srcdir}/AbuseFilter" "${pkgdir}/usr/share/webapps/mediawiki/extensions/"
}

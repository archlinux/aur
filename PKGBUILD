# Maintainer: nl6720 <nl6720@archlinux.org>

pkgname=mediawiki-extension-abusefilter
pkgver=1.37+r6427+g79d4cce40
pkgrel=1
_mw='1.37'
_commit='79d4cce40f7aa25132cbd2b1dd29434d668a67c6' # git rev-parse "REL${_mw/./_}"
pkgdesc='An extension for MediaWiki that allows privileged users to set specific actions to be taken when actions by users, such as edits, match certain criteria'
arch=('any')
url='https://www.mediawiki.org/wiki/Extension:AbuseFilter'
license=('GPL')
makedepends=('git')
conflicts=('mediawiki>=1.38')
source=("git+https://gerrit.wikimedia.org/r/mediawiki/extensions/AbuseFilter.git#commit=${_commit}")
sha512sums=('SKIP')

pkgver() {
	cd "${srcdir}/AbuseFilter"
	printf '%s+r%s+g%s' "${_mw}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	install -d -m755 "${pkgdir}/usr/share/webapps/mediawiki/extensions"
	cp -r "${srcdir}/AbuseFilter" "${pkgdir}/usr/share/webapps/mediawiki/extensions/"
}

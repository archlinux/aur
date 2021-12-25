# Maintainer: nl6720 <nl6720@archlinux.org>

pkgname=mediawiki-extension-abusefilter
pkgver=1.37+r6403+gb36e6a2ca
pkgrel=1
_mw='1.37'
_commit='b36e6a2ca44a7a46d2a20263c194b50afca6e41c' # git rev-parse "REL${_mw/./_}"
pkgdesc='An extension for MediaWiki that allows privileged users to set specific actions to be taken when actions by users, such as edits, match certain criteria'
arch=('any')
url='https://www.mediawiki.org/wiki/Extension:AbuseFilter'
license=('GPL')
makedepends=('git')
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

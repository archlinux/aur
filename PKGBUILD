# Maintainer: nl6720 <nl6720@archlinux.org>

pkgname=mediawiki-extension-bouncehandler
pkgver=1.37+r427+g8c6a24b
pkgrel=1
_mw='1.37'
_commit='8c6a24bed57f3b34a82747bbef060da37c24818b' # git rev-parse "REL${_mw/./_}"
pkgdesc='An extension for MediaWiki that allows a wiki to handle bounce emails efficiently'
arch=('any')
url='https://www.mediawiki.org/wiki/Extension:BounceHandler'

license=('GPL')
makedepends=('git')
source=("git+https://gerrit.wikimedia.org/r/mediawiki/extensions/BounceHandler.git#commit=${_commit}")
sha512sums=('SKIP')

pkgver() {
	cd "${srcdir}/BounceHandler"
	printf '%s+r%s+g%s' "${_mw}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	install -d -m755 "${pkgdir}/usr/share/webapps/mediawiki/extensions"
	cp -r "${srcdir}/BounceHandler" "${pkgdir}/usr/share/webapps/mediawiki/extensions/"
}

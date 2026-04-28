# Maintainer: nl6720 <nl6720@archlinux.org>

pkgname=mediawiki-extension-bouncehandler
pkgver=1.45+r561+gdccbcc5
pkgrel=1
_mw='1.45'
_commit='dccbcc5a7fb0d97b3b752887e64f908301382550' # git rev-parse "REL${_mw/./_}"
pkgdesc='An extension for MediaWiki that allows a wiki to handle bounce emails efficiently'
arch=('any')
url='https://www.mediawiki.org/wiki/Extension:BounceHandler'

license=('GPL-2.0-or-later')
makedepends=('git')
source=("git+https://gerrit.wikimedia.org/r/mediawiki/extensions/BounceHandler.git#commit=${_commit}")
sha512sums=('76cbce1fdc2adba754f03dfb8abc3172ca2b856cab195c8e0ca80c6b14fb6b413b99531a3f469ade31f0d9348d9d319fa1e53dc245a71300dcefaa1f1a565b94')

pkgver() {
	cd "${srcdir}/BounceHandler"
	printf '%s+r%s+g%s' "${_mw}" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
	install -d -m755 "${pkgdir}/usr/share/webapps/mediawiki/extensions"
	cp -r "${srcdir}/BounceHandler" "${pkgdir}/usr/share/webapps/mediawiki/extensions/"
}

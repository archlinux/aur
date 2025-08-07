# Maintainer: nl6720 <nl6720@archlinux.org>

pkgname=mediawiki-extension-bouncehandler
pkgver=1.44+r539+g0333aba
pkgrel=1
_mw='1.44'
_commit='0333abae9f7f4d08fe6c4d2e6a269a5b1040ca57' # git rev-parse "REL${_mw/./_}"
pkgdesc='An extension for MediaWiki that allows a wiki to handle bounce emails efficiently'
arch=('any')
url='https://www.mediawiki.org/wiki/Extension:BounceHandler'

license=('GPL-2.0-or-later')
makedepends=('git')
source=("git+https://gerrit.wikimedia.org/r/mediawiki/extensions/BounceHandler.git#commit=${_commit}")
sha512sums=('fd37ff04e990cc8b955abee9b06d44095c247d8e1daa462d248b915aa09407fafa429c8bc35e2d6ef447bf87d3f6294b30ab9a1b9b0edfb9c5fe154a237ff1e3')

pkgver() {
	cd "${srcdir}/BounceHandler"
	printf '%s+r%s+g%s' "${_mw}" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
	install -d -m755 "${pkgdir}/usr/share/webapps/mediawiki/extensions"
	cp -r "${srcdir}/BounceHandler" "${pkgdir}/usr/share/webapps/mediawiki/extensions/"
}

# Maintainer: nl6720 <nl6720@gmail.com>

pkgname=mediawiki-extension-disableaccount
pkgver=REL1_34+r376+g1e6f5ef
pkgrel=1
_mw='REL1_34'
_commit='1e6f5efdac9aebc44505c37a067c651ca9dd2b8d'
pkgdesc="An extension for MediaWiki that allows administrators to disable individual users' wiki accounts"
arch=('any')
url='https://www.mediawiki.org/wiki/Extension:DisableAccount'
license=('GPL')
makedepends=('git')
source=("git+https://gerrit.wikimedia.org/r/mediawiki/extensions/DisableAccount.git#commit=${_commit}")
sha512sums=('SKIP')

pkgver() {
	cd "${srcdir}/DisableAccount"
	printf '%s+r%s+g%s' "${_mw}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	install -d -m755 "${pkgdir}/usr/share/webapps/mediawiki/extensions"
	cp -r "${srcdir}/DisableAccount" "${pkgdir}/usr/share/webapps/mediawiki/extensions/"
}

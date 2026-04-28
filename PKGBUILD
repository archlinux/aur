# Maintainer: nl6720 <nl6720@archlinux.org>

pkgname=mediawiki-extension-lockdown
pkgver=1.45+r222+ge6f280a
pkgrel=1
_mw='1.45'
_commit='e6f280af7dd7000744051595e6bfaa8f8fd89115' # git rev-parse "REL${_mw/./_}"
pkgdesc='An extension for MediaWiki that implements a way to restrict access to specific namespaces and special pages to a given set of user groups'
arch=('any')
url='https://www.mediawiki.org/wiki/Extension:Lockdown'
license=('GPL-2.0-or-later')
makedepends=('git')
source=("git+https://gerrit.wikimedia.org/r/mediawiki/extensions/Lockdown.git#commit=${_commit}")
sha512sums=('4fcc1a90f157d06d8e6b23c33f14dae062ebf089308ef2aa96b61ac78df6a9bef23d728c9d2709d51fcb69b5c949485b76738f7845ed56dc87fc1eb635117120')

pkgver() {
	cd "${srcdir}/Lockdown"
	printf '%s+r%s+g%s' "${_mw}" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
	install -d -m755 "${pkgdir}/usr/share/webapps/mediawiki/extensions"
	cp -r "${srcdir}/Lockdown" "${pkgdir}/usr/share/webapps/mediawiki/extensions/"
}

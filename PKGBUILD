# Maintainer: nl6720 <nl6720@archlinux.org>

pkgname=mediawiki-extension-lockdown
pkgver=1.44+r212+gb0f3e53
pkgrel=1
_mw='1.44'
_commit='b0f3e5306eb06eb51479546760ec587442028d07' # git rev-parse "REL${_mw/./_}"
pkgdesc='An extension for MediaWiki that implements a way to restrict access to specific namespaces and special pages to a given set of user groups'
arch=('any')
url='https://www.mediawiki.org/wiki/Extension:Lockdown'
license=('GPL-2.0-or-later')
makedepends=('git')
source=("git+https://gerrit.wikimedia.org/r/mediawiki/extensions/Lockdown.git#commit=${_commit}")
sha512sums=('0be6ec2b712f778cb3ef6bba25dba7cde9a0b89e74b28ed9d485d96e6ca913f829c846e1c6204ddf27650522e9622c733f68fde6bf8f256a32a003d7f66bef36')

pkgver() {
	cd "${srcdir}/Lockdown"
	printf '%s+r%s+g%s' "${_mw}" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
	install -d -m755 "${pkgdir}/usr/share/webapps/mediawiki/extensions"
	cp -r "${srcdir}/Lockdown" "${pkgdir}/usr/share/webapps/mediawiki/extensions/"
}

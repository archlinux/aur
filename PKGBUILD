# Maintainer: nl6720 <nl6720@archlinux.org>

pkgname=mediawiki-extension-usermerge
pkgver=1.44+r1197+g7aef163
pkgrel=1
_mw='1.44'
_commit='7aef163ea29a638d7fc33ff0ad81525bf7c2fda4' # git rev-parse "REL${_mw/./_}"
pkgdesc="An extension for MediaWiki that allows to merge one Wiki user's account with another Wiki user's account"
arch=('any')
url='https://www.mediawiki.org/wiki/Extension:UserMerge'
license=('GPL-2.0-or-later')
makedepends=('git')
source=("git+https://gerrit.wikimedia.org/r/mediawiki/extensions/UserMerge.git#commit=${_commit}")
sha512sums=('7bccebb9d7ea98b5f816fc9c83290996f57ec833a44fa6947e35dfc31a1e38755a6af4f194d3b627f78c126d2236b2114b94a3e01eaaecb1cb66019417c5e236')

pkgver() {
	cd "${srcdir}/UserMerge"
	printf '%s+r%s+g%s' "${_mw}" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
	install -d -m755 "${pkgdir}/usr/share/webapps/mediawiki/extensions"
	cp -r "${srcdir}/UserMerge" "${pkgdir}/usr/share/webapps/mediawiki/extensions/"
}

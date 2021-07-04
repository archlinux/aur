# Maintainer: Anty0 <anty150 at gmail dot com>
# Contributor: Hezekiah Michael <spiritomb at protonmail dot com>


# Helper variables for updaurpkg (https://aur.archlinux.org/packages/updaurpkg-git)
_nextcloud_appname='drawio'
_upstreamver='v.1.0.1'
_upstreamver_regex='^v\.[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='github-releases'
_repo='pawelrojek/nextcloud-drawio'


pkgdesc='Draw.io integration for Nextcloud servers'
pkgname=('nextcloud-app-drawio')
pkgver="${_upstreamver:2}"
pkgrel=1
arch=('any')
license=('AGPL')
url="https://github.com/${_repo}"
makedepends=()
depends=('nextcloud')
options=('!strip')
source=("${_nextcloud_appname}-v${pkgver}.tar.gz::${url}/releases/download/${_upstreamver}/${_nextcloud_appname}-v${pkgver}.tar.gz")

md5sums=('f5428d4881d12e32126fb881e5776e39')
sha256sums=('db62c7184b7506516e633ff97b11e7ed3ebcda2ca1df88d4b41c1062bbc93a29')

package() {
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/${_nextcloud_appname}" "${pkgdir}/usr/share/webapps/nextcloud/apps/${_nextcloud_appname}"
}

# Maintainer: Anty0 <anty150 at gmail dot com>
# Contributor: Hezekiah Michael <spiritomb at protonmail dot com>


# Helper variables for updaurpkg (https://aur.archlinux.org/packages/updaurpkg-git)
_nextcloud_appname='drawio'
_upstreamver='v.1.0.0'
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

md5sums=('9a72f133e440d85f93956bc147202029')
sha256sums=('15efeba0dec95b88a72d7f858e569b579a402d78c6563047b6d12b017a95a6b0')

package() {
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/${_nextcloud_appname}" "${pkgdir}/usr/share/webapps/nextcloud/apps/${_nextcloud_appname}"
}

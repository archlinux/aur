# Maintainer: Anty0 <anty150 at gmail dot com>
# Contributor: Hezekiah Michael <spiritomb at protonmail dot com>


# Helper variables for updaurpkg (https://aur.archlinux.org/packages/updaurpkg-git)
_nextcloud_appname='drawio'
_upstreamver='v.0.9.8'
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

md5sums=('cd3f03acfbcfe9f4d21ec76c6e5cd3b8')
sha256sums=('6317c7359157863f90dbfc3e406be0bad3494eeddac00ddad501eb35140626c2')

package() {
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/${_nextcloud_appname}" "${pkgdir}/usr/share/webapps/nextcloud/apps/${_nextcloud_appname}"
}

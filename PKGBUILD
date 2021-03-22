# Maintainer: Anty0 <anty150 at gmail dot com>


# Helper variables for updaurpkg (https://aur.archlinux.org/packages/updaurpkg-git)
_nextcloud_appname='checksum'
_upstreamver='v1.1.2'
_upstreamver_regex='^v[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='github-releases'
_repo='westberliner/checksum'


pkgdesc='Plugin for Nextcloud to create hashes of files'
pkgname=('nextcloud-app-checksum')
pkgver="${_upstreamver:1}"
pkgrel=1
arch=('any')
license=('GPL3')
url="https://github.com/${_repo}"
makedepends=()
depends=('nextcloud')
options=('!strip')
source=("${_nextcloud_appname}-v${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_nextcloud_appname}.tar.gz")
sha512sums=('743e06c538b6f723090c38810e4c3fb0990e1542c8a5ac877a64044afb5fc82b73d59fd0ed3f4b6cafa80537244b3efa2043caa1acd451afe6d1c6d29b031b58')

package() {
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/${_nextcloud_appname}" "${pkgdir}/usr/share/webapps/nextcloud/apps/${_nextcloud_appname}"
}

# Maintainer: Anty0 <anty150 at gmail dot com>


# Helper variables for updaurpkg (https://aur.archlinux.org/packages/updaurpkg-git)
_nextcloud_appname='checksum'
_upstreamver='v1.1.1'
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
sha512sums=('919e8d6a40264372513229fdd3f227c9c1c75c536c427c60af537817a816b3feb13eb5c48c3663f4582f33d9d33587b940b313e74afab6d49ec5dd406889d881')

package() {
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/${_nextcloud_appname}" "${pkgdir}/usr/share/webapps/nextcloud/apps/${_nextcloud_appname}"
}

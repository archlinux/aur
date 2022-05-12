# Maintainer: Anty0 <anty150 at gmail dot com>


# Helper variables for updaurpkg (https://aur.archlinux.org/packages/updaurpkg-git)
_nextcloud_appname='checksum'
_upstreamver='v1.1.4'
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
sha512sums=('857831c55d1667d43cc28d318353b4d77188e4d91bebe9dae5b9bd0bc19f377952ae0c22ce32308aabd53c5991662f70dcfe43e625758f9d23a45680a052d64a')

package() {
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/${_nextcloud_appname}" "${pkgdir}/usr/share/webapps/nextcloud/apps/${_nextcloud_appname}"
}

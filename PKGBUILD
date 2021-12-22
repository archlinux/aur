# Maintainer: Anty0 <anty150 at gmail dot com>


# Helper variables for updaurpkg (https://aur.archlinux.org/packages/updaurpkg-git)
_nextcloud_appname='camerarawpreviews'
_upstreamver='v0.7.15'
_upstreamver_regex='^v[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='github-releases'
_repo='ariselseng/camerarawpreviews'


pkgdesc='A Nextcloud app that provides previews for camera RAW images'
pkgname=('nextcloud-app-camerarawpreviews')
pkgver="${_upstreamver:1}"
pkgrel=1
arch=('any')
license=('AGPL3')
url="https://github.com/${_repo}"
makedepends=()
depends=('nextcloud')
options=('!strip' 'staticlibs' '!purge')
source=("${_nextcloud_appname}-v${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_nextcloud_appname}_nextcloud.tar.gz")
sha512sums=('794ffc9137a5084b0947c89e770db3da0665965aeecc12848f726eb5125b7c7248cbc9c7720cffdf24b72fdc9cc1a5beedfb53e703cb7bd1ea2e823086ee6d3f')

package() {
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/${_nextcloud_appname}" "${pkgdir}/usr/share/webapps/nextcloud/apps/${_nextcloud_appname}"
}

# Maintainer: Anty0 <anty150 at gmail dot com>


# Helper variables for updaurpkg (https://aur.archlinux.org/packages/updaurpkg-git)
_nextcloud_appname='camerarawpreviews'
_upstreamver='v0.7.11'
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
sha512sums=('067fb82044297529f0cf1e39c6e9dcd38d46185c719d4ee31323fc0d0974f5e9443624e877b4701ba315abe308e19cae180e442a017e50e5c97e1acb15720022')

package() {
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/${_nextcloud_appname}" "${pkgdir}/usr/share/webapps/nextcloud/apps/${_nextcloud_appname}"
}

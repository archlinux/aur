# Maintainer: Anty0 <anty150 at gmail dot com>


# Helper variables for updaurpkg (https://aur.archlinux.org/packages/updaurpkg-git)
_nextcloud_appname='camerarawpreviews'
_upstreamver='v0.7.12'
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
sha512sums=('2c73ca586757860c88074e79a8c366b806277621a0c59902c178faf9e4d73ff064777dedba653027cd388cd5543bcbc6914c0ac41c515363e41950934b841a8c')

package() {
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/${_nextcloud_appname}" "${pkgdir}/usr/share/webapps/nextcloud/apps/${_nextcloud_appname}"
}

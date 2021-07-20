# Maintainer: Anty0 <anty150 at gmail dot com>


# Helper variables for updaurpkg (https://aur.archlinux.org/packages/updaurpkg-git)
_nextcloud_appname='video_converter'
_upstreamver='1.0.2'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='github-releases'
_repo='PaulLereverend/NextcloudVideo_Converter'


pkgdesc='Video converter app for Nextcloud'
pkgname=('nextcloud-app-video-converter')
pkgver="${_upstreamver}"
pkgrel=1
arch=('any')
license=('AGPL3')
url="https://github.com/${_repo}"
makedepends=()
depends=('nextcloud')
options=('!strip')
source=("${_nextcloud_appname}-v${pkgver}.tar.gz::${url}/releases/download/${pkgver}/${_nextcloud_appname}.tar.gz")
sha512sums=('e75f35dc8ea602a5a4862fa5506b90b7dfaab7c290ae6c42bc19f3d704f09da32a3fc01116d2fd9230d2e9b0ace7cdfb4aae4bab3f81e87a162665050126c317')

package() {
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/${_nextcloud_appname}" "${pkgdir}/usr/share/webapps/nextcloud/apps/${_nextcloud_appname}"
}

# Maintainer: Anty0 <anty150 at gmail dot com>


# Helper variables for updaurpkg (https://aur.archlinux.org/packages/updaurpkg-git)
_nextcloud_appname='video_converter'
_upstreamver='1.0.4'
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
sha512sums=('1f9ac9041036e8707d6a860cac8c88150a8521d76e4bc641584070e5641559c790748ae584267d4a82ce0e648d6d7ecd60c5942622a672d5af70006287818bb2')

package() {
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/${_nextcloud_appname}" "${pkgdir}/usr/share/webapps/nextcloud/apps/${_nextcloud_appname}"
}

# Maintainer: Anty0 <anty150 at gmail dot com>


# Helper variables for updaurpkg (https://aur.archlinux.org/packages/updaurpkg-git)
_nextcloud_appname='ocdownloader'
_upstreamver='1.8.0'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='github-releases'
_repo='e-alfred/ocdownloader'


pkgdesc='Easy to use download manager using Curl/Aria2 and youtube-dl for Nextcloud'
pkgname=('nextcloud-app-ocdownloader')
pkgver="${_upstreamver}"
pkgrel=1
arch=('any')
license=('AGPL3')
url="https://github.com/${_repo}"
makedepends=()
depends=('nextcloud')
optdepends=(
	'aria2: To use aria2 as download manager'
	'curl: To download files using curl'
	'youtube-dl: To download videos')
options=('!strip')
source=("${_nextcloud_appname}-v${pkgver}.tar.gz::${url}/releases/download/${pkgver}/${_nextcloud_appname}-${pkgver}.tar.gz")
sha512sums=('7dba9e87df471c1c5adaa5ce7ff33524b005cf221758146af1fdd82d82337cda558c3b3bd0709ca60b3942def6c678830bea42ad27eb628c5008249b8ad5f5af')

package() {
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/${_nextcloud_appname}" "${pkgdir}/usr/share/webapps/nextcloud/apps/${_nextcloud_appname}"
}

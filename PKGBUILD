# Maintainer: Anty0 <anty150 at gmail dot com>


# Helper variables for updaurpkg (https://aur.archlinux.org/packages/updaurpkg-git)
_nextcloud_appname='ocdownloader'
_upstreamver='1.7.12'
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
sha512sums=('1513e3e9a3bdedecc2dc214fb678e1392c1c8d965f989aaabcce9fa16c735168734c9f84f3767c5b08db8b1a26b9e513e345c5f1e891a2d5bfe1887aaa5af33d')

package() {
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/${_nextcloud_appname}" "${pkgdir}/usr/share/webapps/nextcloud/apps/${_nextcloud_appname}"
}

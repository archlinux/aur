# Maintainer: Anty0 <anty150 at gmail dot com>


# Helper variables for updaurpkg (https://aur.archlinux.org/packages/updaurpkg-git)
_nextcloud_appname='ocdownloader'
_upstreamver='1.7.10'
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
sha512sums=('ab63b98219487e6ae565dc1f590f9a1b85019211df024186223d9150914655ff41d8fbdd116ff45340d0a589d0fae289d8d0474867726e586cda42e664ed3fee')

package() {
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/${_nextcloud_appname}" "${pkgdir}/usr/share/webapps/nextcloud/apps/${_nextcloud_appname}"
}

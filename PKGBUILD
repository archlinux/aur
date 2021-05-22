# Maintainer: Anty0 <anty150 at gmail dot com>


# Helper variables for updaurpkg (https://aur.archlinux.org/packages/updaurpkg-git)
_nextcloud_appname='facerecognition'
_upstreamver='v0.8.2'
_upstreamver_regex='^v[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='github-releases'
_repo='matiasdelellis/facerecognition'


pkgdesc='Nextcloud app that implement a basic facial recognition system'
pkgname=('nextcloud-app-facerecognition')
pkgver="${_upstreamver:1}"
pkgrel=1
arch=('any')
license=('AGPL3')
url="https://github.com/${_repo}"
makedepends=()
depends=('nextcloud' 'php-pdlib')
options=('!strip')
source=("${_nextcloud_appname}-v${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_nextcloud_appname}.tar.gz")
sha512sums=('461b2ae04219c00414fd03d17b7f0708adb5c5a63eda6d1cd86eaa10aba06af5a20efaa258cb39fd9536f21cb7f07fc89495ad6b9a8c14a0420c57ee05df4f1d')

package() {
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/${_nextcloud_appname}" "${pkgdir}/usr/share/webapps/nextcloud/apps/${_nextcloud_appname}"
}

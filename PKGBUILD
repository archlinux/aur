# Maintainer: Anty0 <anty150 at gmail dot com>


# Helper variables for updaurpkg (https://aur.archlinux.org/packages/updaurpkg-git)
_nextcloud_appname='facerecognition'
_upstreamver='v0.8.3'
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
sha512sums=('cc675bb386f92798a829cf1a5c1ecff6f4a47a905759863982f418d897f76a92dba341772225c3868700c551455c1656370bdaa41d2965e0cd409bc44ce284a4')

package() {
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/${_nextcloud_appname}" "${pkgdir}/usr/share/webapps/nextcloud/apps/${_nextcloud_appname}"
}

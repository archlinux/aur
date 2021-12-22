# Maintainer: Anty0 <anty150 at gmail dot com>


# Helper variables for updaurpkg (https://aur.archlinux.org/packages/updaurpkg-git)
_nextcloud_appname='facerecognition'
_upstreamver='v0.9.1'
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
sha512sums=('36475403285ff74bb2f5609ba2308f4ba92b9597ae22ab2ded85214ea2694b1056ac2018db644c1a51f841a459fd61a7a5dba9a9f1c26da6ada107b6ad0fc618')

package() {
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/${_nextcloud_appname}" "${pkgdir}/usr/share/webapps/nextcloud/apps/${_nextcloud_appname}"
}

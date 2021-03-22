# Maintainer: Anty0 <anty150 at gmail dot com>


# Helper variables for updaurpkg (https://aur.archlinux.org/packages/updaurpkg-git)
_nextcloud_appname='breezedark'
_upstreamver='v21.0.5'
_upstreamver_regex='^v[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='github-releases'
_repo='mwalbeck/nextcloud-breeze-dark'


pkgdesc='Breeze Dark Theme for Nextcloud based on the Breeze Dark theme made by the KDE Project'
pkgname=('nextcloud-app-breezedark')
pkgver="${_upstreamver:1}"
pkgrel=1
arch=('any')
license=('AGPL3')
url="https://github.com/${_repo}"
makedepends=()
depends=('nextcloud')
options=('!strip')
source=("${_nextcloud_appname}-v${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_nextcloud_appname}.tar.gz")
sha512sums=('f99d53547372330c4f040b19de21b19560dfeeee316ae7cbf2d66a2fc807d05149171ac375b19dfa4478ec9461d7e18099289a7cceffdd3f243125cd3ef67371')

package() {
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/${_nextcloud_appname}" "${pkgdir}/usr/share/webapps/nextcloud/apps/${_nextcloud_appname}"
}

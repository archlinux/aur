# Maintainer: Anty0 <anty150 at gmail dot com>


# Helper variables for updaurpkg (https://aur.archlinux.org/packages/updaurpkg-git)
_nextcloud_appname='breezedark'
_upstreamver='v23.1.0'
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
sha512sums=('197c728d4867402c061443c2a4dd0c3e28fa61a88a0b0a363699efebfd4fc1edf860c2e44b7f173e630bb9fc6338629188462c153938f0684f912ebce0186aa5')

package() {
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/${_nextcloud_appname}" "${pkgdir}/usr/share/webapps/nextcloud/apps/${_nextcloud_appname}"
}

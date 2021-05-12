# Maintainer: Anty0 <anty150 at gmail dot com>


# Helper variables for updaurpkg (https://aur.archlinux.org/packages/updaurpkg-git)
_nextcloud_appname='integration_dropbox'
_upstreamver='v1.0.1'
_upstreamver_regex='^v[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='github-releases'
_repo='eneiluj/integration_dropbox'


pkgdesc='Dropbox integration into Nextcloud'
pkgname=('nextcloud-app-integration-dropbox')
pkgver="${_upstreamver:1}"
pkgrel=1
arch=('any')
license=('AGPL3')
url="https://github.com/${_repo}"
makedepends=()
depends=('nextcloud')
options=('!strip')
source=("${_nextcloud_appname}-v${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_nextcloud_appname}-${pkgver}.tar.gz")
sha512sums=('4e386bc959ee5ef41e7b6bd3289d4f6c02738b3a0d13d2f2517d1c006ec0138468fb88ac77573c2974b657fcc608a3a7fe3f3e4595ba77164b26da1a9a20bce4')

package() {
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/${_nextcloud_appname}" "${pkgdir}/usr/share/webapps/nextcloud/apps/${_nextcloud_appname}"
}

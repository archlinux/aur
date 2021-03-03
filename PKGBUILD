# Maintainer: Anty0 <anty150 at gmail dot com>


# Helper variables for updaurpkg (https://aur.archlinux.org/packages/updaurpkg-git)
_nextcloud_appname='integration_dropbox'
_upstreamver='v0.0.18'
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
sha512sums=('025c3fb49046569a79a56b53a5933ec109015fc224b406846fb8b793531cfc79bdf9def11d67e61eb0fabbd45de2ed3ce03f5f0d67e56fa716b4e017201eef80')

package() {
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/${_nextcloud_appname}" "${pkgdir}/usr/share/webapps/nextcloud/apps/${_nextcloud_appname}"
}

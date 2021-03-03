# Maintainer: Anty0 <anty150 at gmail dot com>


# Helper variables for updaurpkg (https://aur.archlinux.org/packages/updaurpkg-git)
_nextcloud_appname='duplicatefinder'
_upstreamver='0.0.6'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='github-releases'
_repo='PaulLereverend/NextcloudDuplicateFinder'


pkgdesc='Duplicate files finder for Nextcloud servers'
pkgname=('nextcloud-app-duplicatefinder')
pkgver="${_upstreamver}"
pkgrel=1
arch=('any')
license=('AGPL3')
url="https://github.com/${_repo}"
makedepends=()
depends=('nextcloud')
options=('!strip')
source=("${_nextcloud_appname}-${pkgver}.tar.gz::${url}/releases/download/${pkgver}/${_nextcloud_appname}.tar.gz")
sha512sums=('d3e95471650af7e50d74b09f3a636dce24d73a845e21760ebd61975b3362a153a94bfd32c36a8f438c2cdaef4527fd98061447a456b3beca7976ccf4c704e8f9')

package() {
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/${_nextcloud_appname}" "${pkgdir}/usr/share/webapps/nextcloud/apps/${_nextcloud_appname}"
}

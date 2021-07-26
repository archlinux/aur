# Maintainer: Anty0 <anty150 at gmail dot com>


# Helper variables for updaurpkg (https://aur.archlinux.org/packages/updaurpkg-git)
_nextcloud_appname='duplicatefinder'
_upstreamver='0.0.11'
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
sha512sums=('6df5ac701b390e942b9b4a7f4556cdebabcc4b87bcbb2e56e1abcd3a5cefb7f2aedd225e4d92f77de31e11c068a85820f841de2b1ac8cd00658918b650cc979d')

package() {
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/${_nextcloud_appname}" "${pkgdir}/usr/share/webapps/nextcloud/apps/${_nextcloud_appname}"
}

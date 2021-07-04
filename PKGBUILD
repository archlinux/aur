# Maintainer: Anty0 <anty150 at gmail dot com>


# Helper variables for updaurpkg (https://aur.archlinux.org/packages/updaurpkg-git)
_upstreamver='v2.14.0'
_upstreamver_regex='^v[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='github-releases'
_repo='nextcloud-releases/files_texteditor'


pkgdesc='The original text editor app for Nextcloud, based on Ace'
pkgname=('nextcloud-app-files-texteditor')
_nextcloud_appname='files_texteditor'
pkgver="${_upstreamver:1}"
pkgrel=1
arch=('any')
license=('AGPL')
url="https://github.com/${_repo}"
makedepends=()
depends=('nextcloud')
options=('!strip')
source=("files_texteditor-v${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_nextcloud_appname}.tar.gz")
sha512sums=('ba2dad5f541df894ea422cfc66dd6e2daefe99739cfda41cb081409b7dbc5238ef49bff560c28c2e149af25ddfb0084ead248b87156e185f3b14913a824ca5ca')

package() {
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/${_nextcloud_appname}" "${pkgdir}/usr/share/webapps/nextcloud/apps/${_nextcloud_appname}"
}

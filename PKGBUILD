# Maintainer: Anty0 <anty150 at gmail dot com>


# Helper variables for updaurpkg (https://aur.archlinux.org/packages/updaurpkg-git)
_upstreamver='v2.13.0'
_upstreamver_regex='^v[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='github-releases'
_repo='nextcloud/files_texteditor'


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
sha512sums=('9d2037e4b972beb3cf6fc10de21d582f98ccca128fd0e560f45810fb64de125a3fcf5489dad0340f60ab878470f3e7bd11a5bfd918d25a240d44640386a2c18a')

package() {
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/${_nextcloud_appname}" "${pkgdir}/usr/share/webapps/nextcloud/apps/${_nextcloud_appname}"
}

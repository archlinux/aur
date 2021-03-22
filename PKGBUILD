# Maintainer: Anty0 <anty150 at gmail dot com>


# Helper variables for updaurpkg (https://aur.archlinux.org/packages/updaurpkg-git)
_nextcloud_appname='integration_github'
_upstreamver='v1.0.0'
_upstreamver_regex='^v[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='github-releases'
_repo='nextcloud/integration_github'


pkgdesc='GitHub integration in Nextcloud'
pkgname=('nextcloud-app-integration-github')
pkgver="${_upstreamver:1}"
pkgrel=1
arch=('any')
license=('AGPL3')
url="https://github.com/${_repo}"
makedepends=()
depends=('nextcloud')
options=('!strip')
source=("${_nextcloud_appname}-v${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_nextcloud_appname}-${pkgver}.tar.gz")
sha512sums=('02bd5b83ed7e412f8c74cc411ab5d17458c9db53a89528fee3d22bc0645cddb993c29dc1198e4d5308a73070837f2af66529475c1afce345ca154fed8a488c89')

package() {
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/${_nextcloud_appname}" "${pkgdir}/usr/share/webapps/nextcloud/apps/${_nextcloud_appname}"
}

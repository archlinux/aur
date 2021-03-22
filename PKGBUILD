# Maintainer: Anty0 <anty150 at gmail dot com>


# Helper variables for updaurpkg (https://aur.archlinux.org/packages/updaurpkg-git)
_nextcloud_appname='integration_gitlab'
_upstreamver='v1.0.0'
_upstreamver_regex='^v[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='github-releases'
_repo='nextcloud/integration_gitlab'


pkgdesc='GitLab integration into Nextcloud'
pkgname=('nextcloud-app-integration-gitlab')
pkgver="${_upstreamver:1}"
pkgrel=1
arch=('any')
license=('AGPL3')
url="https://github.com/${_repo}"
makedepends=()
depends=('nextcloud')
options=('!strip')
source=("${_nextcloud_appname}-v${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_nextcloud_appname}-${pkgver}.tar.gz")
sha512sums=('63c0665804d0728ad256ed4c5e5f5dcc0d35cb3939cc6dcc46189ce267d771ad2fd40ea9a47f7c938d804c729262461b382045c903adf8816b080ec0879ec5bc')

package() {
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/${_nextcloud_appname}" "${pkgdir}/usr/share/webapps/nextcloud/apps/${_nextcloud_appname}"
}

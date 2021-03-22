# Maintainer: Anty0 <anty150 at gmail dot com>


# Helper variables for updaurpkg (https://aur.archlinux.org/packages/updaurpkg-git)
_nextcloud_appname='integration_google'
_upstreamver='v1.0.0'
_upstreamver_regex='^v[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='github-releases'
_repo='nextcloud/integration_google'


pkgdesc='Google integration in Nextcloud'
pkgname=('nextcloud-app-integration-google')
pkgver="${_upstreamver:1}"
pkgrel=1
arch=('any')
license=('AGPL3')
url="https://github.com/${_repo}"
makedepends=()
depends=('nextcloud')
options=('!strip')
source=("${_nextcloud_appname}-v${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_nextcloud_appname}-${pkgver}.tar.gz")
sha512sums=('4732ba90693950ab782266b7118ea502f615ef2c14c5ebcbd0917707c867e571e3c00b485d9a922aca965badfa0263befacc8792ee0db9cb9fa9b67ecd80b719')

package() {
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/${_nextcloud_appname}" "${pkgdir}/usr/share/webapps/nextcloud/apps/${_nextcloud_appname}"
}

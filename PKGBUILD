# Maintainer: Anty0 <anty150 at gmail dot com>


# Helper variables for updaurpkg (https://aur.archlinux.org/packages/updaurpkg-git)
_nextcloud_appname='duplicatefinder'
_upstreamver='0.0.14'
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
sha512sums=('d27bc88c8846e3ca95602eaa4eb31e04e54594bc8e6b0d148411550908b54da61c242d94e8b831bbf86de6d56a228e55649bc48a77c4c965ab114e8666278bd9')

package() {
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/${_nextcloud_appname}" "${pkgdir}/usr/share/webapps/nextcloud/apps/${_nextcloud_appname}"
}

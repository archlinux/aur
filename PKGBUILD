# Maintainer: Anty0 <anty150 at gmail dot com>
# Contributor: Hezekiah Michael <spiritomb at protonmail dot com>


# Helper variables for updaurpkg (https://aur.archlinux.org/packages/updaurpkg-git)
_nextcloud_appname='drawio'
_upstreamver='v.1.0.2'
_upstreamver_regex='^v\.[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='github-releases'
_repo='pawelrojek/nextcloud-drawio'


pkgdesc='Draw.io integration for Nextcloud servers'
pkgname=('nextcloud-app-drawio')
pkgver="${_upstreamver:2}"
pkgrel=1
arch=('any')
license=('AGPL')
url="https://github.com/${_repo}"
makedepends=()
depends=('nextcloud')
options=('!strip')
source=("${_nextcloud_appname}-v${pkgver}.tar.gz::${url}/releases/download/${_upstreamver}/${_nextcloud_appname}-v${pkgver}.tar.gz")

md5sums=('6c7e16fd70dc8075adc74936fcc01986')
sha256sums=('f54337ad70f882acf1d0344f1dfe51a5ae81cff886f26b833e69f861874a4484')

package() {
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/${_nextcloud_appname}" "${pkgdir}/usr/share/webapps/nextcloud/apps/${_nextcloud_appname}"
}

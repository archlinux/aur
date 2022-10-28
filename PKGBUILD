# Maintainer: Damjan Georgievski <gdamjan@gmail.com>

pkgname=nextcloud-app-totp
_releasename=twofactor_totp
pkgver=6.4.1
pkgrel=2
pkgdesc="Two factor TOTP provider for Nextcloud"
arch=('any')
url="https://github.com/nextcloud-releases/twofactor_totp"
license=('AGPL')
depends=('nextcloud>=22.0' 'nextcloud<25.0.0')
makedepends=()
options=('!strip')
source=(
    "${_releasename}-${pkgver}.tar.gz"::"${url}/releases/download/v${pkgver}/${_releasename}-v${pkgver}.tar.gz"
)

package() {
    cd $srcdir/$_releasename
    install -d --owner=root --group=root $pkgdir/usr/share/webapps/nextcloud/apps/
    cp -r --target-directory=$pkgdir/usr/share/webapps/nextcloud/apps/ $srcdir/$_releasename
}

sha256sums=('59ad8feada69ef92310ac4c6e01e4343cfa24f347bca32818b864305cbfe00e2')

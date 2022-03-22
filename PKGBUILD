# Maintainer: Damjan Georgievski <gdamjan@gmail.com>

pkgname=nextcloud-app-totp
_releasename=twofactor_totp
pkgver=6.2.0
pkgrel=2
pkgdesc="Two factor TOTP provider for Nextcloud"
arch=('any')
url="https://github.com/nextcloud-releases/twofactor_totp"
license=('AGPL')
depends=('nextcloud>=21.0')
makedepends=()
options=('!strip')
source=(
    "${_releasename}-${pkgver}.tar.gz"::"${url}/releases/download/v${pkgver}/${_releasename}.tar.gz"
    "php-8.1.patch"
)

package() {
    cd $srcdir/$_releasename
    patch -p1 < $srcdir/php-8.1.patch
    install -d --owner=root --group=root $pkgdir/usr/share/webapps/nextcloud/apps/
    cp -r --target-directory=$pkgdir/usr/share/webapps/nextcloud/apps/ $srcdir/$_releasename
}

sha256sums=('afa5ae5c0bc65c8127e92562071c8ca7df0905358be9f47c3090dc75b6b5800f'
            '7ac4fc91952ef5d21001e1823c815540fa0d17fbfd837ebf1c63cefa71ffb6e2')

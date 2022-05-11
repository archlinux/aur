# Maintainer: Damjan Georgievski <gdamjan@gmail.com>

pkgname=nextcloud-app-totp
_releasename=twofactor_totp
pkgver=6.3.0
pkgrel=1
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

sha256sums=('0ccd3feaf369e90a66179914c5ab48f43c4fd38cb7a5e037857b7337a333859d'
            '7ac4fc91952ef5d21001e1823c815540fa0d17fbfd837ebf1c63cefa71ffb6e2')
sha256sums=('0ccd3feaf369e90a66179914c5ab48f43c4fd38cb7a5e037857b7337a333859d'
            'c31f045c2cc47c8e0d9552b19e556ccae93572e9e043ad5ad51063ad826d226f')

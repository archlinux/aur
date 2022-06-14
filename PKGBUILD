# Maintainer: Damjan Georgievski <gdamjan@gmail.com>

pkgname=nextcloud-app-u2f
_releasename=twofactor_u2f
pkgver=6.3.1
pkgrel=1
pkgdesc="Two factor U2F provider for Nextcloud"
arch=('any')
url="https://github.com/nextcloud-releases/twofactor_u2f"
license=('AGPL')
depends=('nextcloud>=20.0' 'nextcloud<24.0')
makedepends=()
options=('!strip')
source=(
    "${_releasename}-${pkgver}.tar.gz"::"${url}/releases/download/v${pkgver}/${_releasename}.tar.gz"
    "php-8.1.patch")

package() {
    cd $srcdir/$_releasename
    patch -p1 < $srcdir/php-8.1.patch
    install -d --owner=root --group=root $pkgdir/usr/share/webapps/nextcloud/apps/
    cp -r --target-directory=$pkgdir/usr/share/webapps/nextcloud/apps/ $srcdir/$_releasename
}

sha256sums=('9397bf5a152dfa30e29990b2d2f8e19bb13d2d525ad24f8077c4af2802c6b8db'
            'f886f6832bb09de756353f0fe6a01ccba5c96986c6284488019e3e861d8425fa')

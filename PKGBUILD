# Maintainer: Damjan Georgievski <gdamjan@gmail.com>

pkgname=nextcloud-app-totp
_releasename=twofactor_totp
pkgver=6.4.0
pkgrel=1
pkgdesc="Two factor TOTP provider for Nextcloud"
arch=('any')
url="https://github.com/nextcloud-releases/twofactor_totp"
license=('AGPL')
depends=('nextcloud>=22.0')
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

sha256sums=('711b6946cd6cdf597cc46f38624648b91dc2de983691014d96b6367f9353481a')

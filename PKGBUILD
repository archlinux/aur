# Maintainer: Damjan Georgievski <gdamjan@gmail.com>

pkgname=nextcloud-app-u2f
_releasename=twofactor_u2f
pkgver=3.0.1
pkgrel=1
pkgdesc="Two factor U2F provider for Nextcloud"
arch=('any')
url="https://github.com/nextcloud/twofactor_u2f"
license=('AGPL')
depends=('nextcloud>=16.0')
makedepends=()
options=('!strip')
source=("${_releasename}-${pkgver}.tar.gz"::"${url}/releases/download/v${pkgver}/${_releasename}.tar.gz")

build() {
    cd "$srcdir/${_releasename}"
}

package() {
    install -d --owner=root --group=root $pkgdir/usr/share/webapps/nextcloud/apps/
    cp -r --target-directory=$pkgdir/usr/share/webapps/nextcloud/apps/ $srcdir/$_releasename
}

sha256sums=('ad1d64f1c228513ad987f31874a518aa20371607ca8e58477ca46155638a2f90')

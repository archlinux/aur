#Maintainer: Julius Härtl <jus@bitgrid.net>

pkgname=nautilus-nextcloud
pkgver=2.5.0
pkgrel=1
pkgdesc="Nautilus plugin for Nextcloud client integration"
url="https://github.com/nextcloud/desktop"
makedepends=('git')
arch=('x86_64')
depends=('python-nautilus')
license=('GPL2')
source=("https://github.com/nextcloud/desktop/archive/v${pkgver}-beta2.tar.gz")

sha256sums=('9fd5fccedd6f59a7bb31854c6d69b626a781027301d9a0d66bd356a2c341a695')

package() {
    cd desktop-$pkgver-beta2
    cd ./shell_integration/nautilus/
    ./setappname.sh Nextcloud
    cd ../../
    install -Dm644 shell_integration/nautilus/syncstate.py "$pkgdir/usr/share/nautilus-python/extensions/syncstate-Nextcloud.py"
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}


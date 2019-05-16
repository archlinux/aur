# Maintainer: Kevin Del Castillo R. <quebin31@gmail.com>

pkgname=nvman
pkgver=1.2.0
pkgrel=1
pkgdesc="NVIDIA Manager for Optimus/Bumblebee"
arch=('any')
url=https://github.com/quebin31/nvman
license=('GPL')
depends=('bumblebee' 'primus' 'optimus-manager')
optdepends=()
conflicts=()
options=()
install=$pkgname.install
source=("https://github.com/quebin31/$pkgname/archive/$pkgver.tar.gz")
md5sums=(27da24091f5c3fc3fa87425fdccaa239)

package() {
    cd "$pkgname-$pkgver"

    mkdir -p "$pkgdir/usr/bin/"
    mkdir -p "$pkgdir/usr/lib/systemd/system/"
    mkdir -p "$pkgdir/etc/nvman/"

    install $pkgname "$pkgdir/usr/bin/"
    cp "$pkgname.service" "$pkgdir/usr/lib/systemd/system/"
    cp config "$pkgdir/etc/nvman/"
}

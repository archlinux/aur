# Maintainer: Kevin Del Castillo R. <quebin31@gmail.com>

pkgname=nvman
pkgver=1.2.2
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
md5sums=(ef15fb793973eab6a9d25adb33a14469)

package() {
    cd "$pkgname-$pkgver"

    mkdir -p "$pkgdir/usr/bin/"
    mkdir -p "$pkgdir/usr/lib/systemd/system/"
    mkdir -p "$pkgdir/etc/nvman/"

    install $pkgname "$pkgdir/usr/bin/"
    cp "$pkgname.service" "$pkgdir/usr/lib/systemd/system/"
    cp config "$pkgdir/etc/nvman/"
}

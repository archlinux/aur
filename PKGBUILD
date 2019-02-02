# Maintainer: Kevin Del Castillo R. <lans9831@gmail.com>

pkgname=nvman
pkgver=1.1
pkgrel=1
pkgdesc="NVIDIA Manager for Optimus/Bumblebee"
arch=('any')
url=https://github.com/lans98/nvman
license=('GPL')
depends=('bumblebee' 'primus' 'optimus-manager')
optdepends=()
conflicts=()
options=()
install=$pkgname.install
source=("https://github.com/lans98/$pkgname/archive/$pkgver.tar.gz")
md5sums=(046714c66b69d3612619ac51b77fb87d)

package() {
    cd "$pkgname-$pkgver"

    mkdir -p "$pkgdir/usr/bin/"
    mkdir -p "$pkgdir/usr/lib/systemd/system/"
    mkdir -p "$pkgdir/etc/nvman/"

    install $pkgname "$pkgdir/usr/bin/"
    cp "$pkgname.service" "$pkgdir/usr/lib/systemd/system/"
    cp config "$pkgdir/etc/nvman/"
}

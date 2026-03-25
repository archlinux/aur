pkgname=kiraws
pkgver=1.4
pkgrel=1
pkgdesc="Kira web server, a simple yet flexible and scalable web server written in python"
arch=('x86_64' 'arm7h' 'aarch64')
url="https://gitlab.com/linuxbombay/kira"
license=('GPL')
depends=('python')
makedepends=('unzip')
source=("$url/-/archive/$pkgver/kira-$pkgver.tar.bz2")
sha256sums=('f45d57ee93ca0ac4b603b999b2c94d91226317369da899c0b47833464b94e553')

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/lib/kiraws"

    cd "$srcdir/kira-$pkgver"
    chmod +x kira   
    cp -r ./ "$pkgdir/usr/lib/kiraws"

    # Link to binary
    ln -s "/usr/lib/kiraws/kira" "$pkgdir/usr/bin/kira"
}

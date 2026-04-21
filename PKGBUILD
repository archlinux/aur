pkgname=kiraws
pkgver=1.5
pkgrel=1
pkgdesc="Kira web server, a simple yet flexible and scalable web server written in python"
arch=('x86_64' 'arm7h' 'aarch64')
url="https://gitlab.com/linuxbombay/kira"
license=('GPL')
depends=('python')
makedepends=('unzip')
source=("$url/-/archive/$pkgver/kira-$pkgver.tar.bz2")
sha256sums=('f115f071518fefa9220d6a123ee5745545e3f98ee595764e5f5f79e066529405')

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/lib/kiraws"

    cd "$srcdir/kira-$pkgver"
    chmod +x kira   
    cp -r ./ "$pkgdir/usr/lib/kiraws"

    # Link to binary
    ln -s "/usr/lib/kiraws/kira" "$pkgdir/usr/bin/kira"
}

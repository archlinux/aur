pkgname=kiraws
pkgver=1.7.3.2
pkgrel=1
pkgdesc="Kira web server, a simple yet flexible and scalable web server written in python"
arch=('x86_64' 'arm7h' 'aarch64')
url="https://gitlab.com/linuxbombay/kira"
license=('GPL')
depends=('python')
makedepends=('unzip')
source=("$url/-/archive/$pkgver/kira-$pkgver.tar.bz2")
sha256sums=('bb2d460a5c4c1ad94d177163b295e327a7632c8df7b400b529d79f053353c475')

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/lib/kiraws"

    cd "$srcdir/kira-$pkgver"
    chmod +x kira   
    cp -r ./ "$pkgdir/usr/lib/kiraws"

    # Link to binary
    ln -s "/usr/lib/kiraws/kira" "$pkgdir/usr/bin/kira"
}

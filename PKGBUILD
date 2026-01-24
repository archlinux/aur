pkgname=kiraws
pkgver=1.2
pkgrel=1
pkgdesc="Kira web server, a simple yet flexible and scalable web server written in python"
arch=('x86_64' 'arm7h' 'aarch64')
url="https://gitlab.com/coreybruce/kira"
license=('GPL')
depends=('python')
makedepends=('unzip')
source=("$url/-/archive/$pkgver/kira-$pkgver.tar.bz2")
sha256sums=('fd9bd09e99dc48a9d4da5f2a37c7ab37c27d3d68436ee89115d288bf5b05fb00')

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/lib/kiraws"

    cd "$srcdir/kira-$pkgver"
    chmod +x kira   
    cp -r ./ "$pkgdir/usr/lib/kiraws"

    # Link to binary
    ln -s "/usr/lib/kiraws/kira" "$pkgdir/usr/bin/kira"
}

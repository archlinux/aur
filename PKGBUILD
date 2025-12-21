pkgname=kiraws
pkgver=1.1
pkgrel=1
pkgdesc="Kira web server, a simple yet flexible and scalable web server written in python"
arch=('x86_64' 'arm7h' 'aarch64')
url="https://gitlab.com/coreybruce/kira"
license=('GPL')
depends=('python')
makedepends=('unzip')
source=("$url/-/archive/1.1/kira-$pkgver.tar.bz2")
sha256sums=('ce80ff30024b502a9cc3bcc1b1a9a70c9e1dab65a541d502dfda20554d81a8f9')

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/lib/kiraws"

    cd "$srcdir/kira-$pkgver"
    chmod +x kira   
    cp -r ./ "$pkgdir/usr/lib/kiraws"

    # Link to binary
    ln -s "/usr/lib/kiraws/kira" "$pkgdir/usr/bin/kira"
}

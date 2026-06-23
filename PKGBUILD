# Maintainer: Deon Spengler <deon@spengler.co.za>

pkgname=stem
pkgver=0.9.3
pkgrel=1
pkgdesc="st terminal with kitty graphics, scrollback and configuration via Xresources"
arch=('x86_64')
url="https://github.com/deonspengler/stem"
license=('MIT')
depends=('libxft' 'imlib2')
provides=('st')
conflicts=('st')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('d493bc91e5e22f3b47acf175c13e56cbb69e00cdfb6fffedf2743a5e576b786f')

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"

    make PREFIX=/usr DESTDIR="$pkgdir" install

    # License text
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

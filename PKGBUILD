# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=grcompiler
pkgver=4.3.1
pkgrel=1
pkgdesc='The SIL Graphite compiler'
arch=('x86_64' 'i686')
url="https://github.com/silnrsi/$pkgname"
makedepends=('icu' 'perl-sgmls')
license=('GPL' 'LGPL' 'CPL')
source=("$pkgname-$pkgname.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e46b4de4552d6e626fede18dbd34502c83ee6d5507ef7ab6b0374f11c24c5912')

build() {
    cd "$pkgname-$pkgver"
    autoreconf -vi
    ./configure --prefix /usr
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
    install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" license/*.txt
}


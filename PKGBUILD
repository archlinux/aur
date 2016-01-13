# Maintainer: Johan Förberg <johan@forberg.se>
pkgname=zstd
pkgver=0.4.6
pkgrel=1
pkgdesc='A fast and efficient compression algorithm.'
arch=('i686' 'x86_64')
url='https://github.com/Cyan4973/zstd'
license=('BSD' 'GPL2')
groups=()
depends=('glibc')
makedepends=('git')
source=("https://github.com/Cyan4973/zstd/archive/v${pkgver}.tar.gz")
noextract=()
sha1sums=('5c3f75e2f043c59bf93a35224f1d00d7d46e23d3')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    LDFLAGS='-I ../lib' make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX="/usr" DESTDIR="$pkgdir/" install
    install -D -m644 lib/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


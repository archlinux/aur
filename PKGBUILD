# Maintainer: Johan Förberg <johan@forberg.se>
pkgname=zstd
pkgver=0.3.2
pkgrel=1
pkgdesc='A fast and efficient compression algorithm.'
arch=('i686' 'x86_64')
url='https://github.com/Cyan4973/zstd'
license=('BSD' 'GPL2')
groups=()
depends=('glibc')
makedepends=('git')
source=("https://github.com/Cyan4973/zstd/archive/zstd-${pkgver}.tar.gz")
noextract=()
sha1sums=('4d3a521c2e59b8496545c6bf82f31c6ea5a2f60f')

build() {
    cd "$srcdir/$pkgname-$pkgname-$pkgver"
    LDFLAGS='-I ../lib' make
}

package() {
    cd "$srcdir/$pkgname-$pkgname-$pkgver"
    make PREFIX="/usr" DESTDIR="$pkgdir/" install
    install -D -m644 lib/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


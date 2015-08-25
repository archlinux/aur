# Maintainer: Johan Förberg <johan@forberg.se>
pkgname=zstd
pkgver=0.1.0
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
sha1sums=('ba01d0390b752a758a79d2949820b5ed32b3cc31') 

build() {
    cd "$srcdir/$pkgname-$pkgver"
    LDFLAGS='-I ../lib' make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
    install -D -m644 lib/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


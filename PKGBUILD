# Maintainer: Johan Förberg <johan@forberg.se>
pkgname=zstd
pkgver=0.2.0
pkgrel=2
pkgdesc='A fast and efficient compression algorithm.'
arch=('i686' 'x86_64')
url='https://github.com/Cyan4973/zstd'
license=('BSD' 'GPL2')
groups=()
depends=('glibc')
makedepends=('git')
source=("https://github.com/Cyan4973/zstd/archive/zstd-${pkgver}.tar.gz")
noextract=()
sha1sums=('2b2818e37a8d2ce04a6d93c77b1045f53b3376dc')

build() {
    cd "$srcdir/$pkgname-$pkgname-$pkgver"
    LDFLAGS='-I ../lib' make
}

package() {
    cd "$srcdir/$pkgname-$pkgname-$pkgver"
    make PREFIX="/usr" DESTDIR="$pkgdir/" install
    install -D -m644 lib/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


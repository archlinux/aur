# Maintainer: Johan Förberg <johan@forberg.se>
pkgname=zstd
pkgver=0.1.1
pkgrel=2
pkgdesc='A fast and efficient compression algorithm.'
arch=('i686' 'x86_64')
url='https://github.com/Cyan4973/zstd'
license=('BSD' 'GPL2')
groups=()
depends=('glibc')
makedepends=('git')
source=("https://github.com/Cyan4973/zstd/archive/v${pkgver}.tar.gz")
noextract=()
sha1sums=('08298ecc23836a74c2158baf0166efbf220d9b0b')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    LDFLAGS='-I ../lib' make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
    install -D -m644 lib/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


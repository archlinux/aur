# Maintainer: Johan Förberg <johan@forberg.se>
pkgname=zstd
pkgver=0.7.0
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
sha1sums=('05d34f4ea78ec209fb5c9056e0d5111d364afa32')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX="/usr" DESTDIR="$pkgdir/" install
    install -D -m644 lib/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


# Maintainer: Johan Förberg <johan@forberg.se>
pkgname=zstd
pkgver=1.0.0
pkgrel=1
pkgdesc='A fast and efficient compression algorithm.'
arch=('i686' 'x86_64')
url='https://github.com/facebook/zstd'
license=('BSD' 'GPL2')
groups=()
depends=('glibc')
source=("https://github.com/facebook/zstd/archive/v${pkgver}.tar.gz")
noextract=()
sha1sums=('4865e52b308fccbf8cabf704f63cadbeccb1b6d9')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX="/usr" DESTDIR="$pkgdir/" install
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -D -m644 PATENTS "$pkgdir/usr/share/licenses/$pkgname/PATENTS"
}


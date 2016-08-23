# Maintainer: Johan Förberg <johan@forberg.se>
pkgname=zstd
pkgver=0.8.1
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
sha1sums=('249f809d7d6982c450703783494b682737786cef')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX="/usr" DESTDIR="$pkgdir/" install
    install -D -m644 lib/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


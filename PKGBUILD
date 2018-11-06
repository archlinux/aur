# Maintainer: Ainola

pkgname=unruu
pkgver=0.1.1
pkgrel=4
pkgdesc='Extracts HTC RUU from .exe files'
license=('GPL3')
arch=('x86_64')
depends=('unshield')
url='https://github.com/kmdm/unruu/'
source=("$pkgname-$pkgver.tar.gz::https://github.com/kmdm/unruu/archive/v$pkgver.tar.gz")
sha256sums=('dda9a7d33c283a772131a19c05a5225ed8e4307e20c33c8c9914801ebc2c0f96')

prepare(){
    cd "$pkgname-$pkgver"
    autoreconf -vfi
}

build() {
    cd "$pkgname-$pkgver"
    ./configure --prefix=/usr
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}

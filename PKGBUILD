# Maintainer: Brian Salcedo <brian@salcedo.tech>
# Contributor: GI Jack <GI_Jack@hackermail.com>
# Contributor: Thomas Gatzweiler <thomas.gatzweiler@gmail.com>

pkgname=flamp
pkgver=2.2.11
pkgrel=1
pkgdesc="A program for the Amateur Multicast Protocol"
arch=('i686' 'x86_64')
url="http://www.w1hkj.com/flamp2.1-help/index.html"
license=('GPL')
groups=('w1hkj')
depends=('fldigi')
source=(http://downloads.sourceforge.net/project/fldigi/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('9fb365ec499b1f89e38f3d1315443ee7dd4307e8bbde76edb8070b57ea55b5e2')

build() {
    cd $pkgname-$pkgver
    ./configure --prefix=/usr
    make
}

check() {
    cd "$srcdir"/$pkgname-$pkgver
    make -k check
}

package() {
    cd "$srcdir"/$pkgname-$pkgver
    make DESTDIR="$pkgdir" install
}

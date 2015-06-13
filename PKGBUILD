# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=outguess
pkgver=0.2
pkgrel=2
pkgdesc="A universal steganographic tool"
arch=('i686' 'x86_64')
url="http://www.outguess.org"
license=('GPL')
#source=(http://www.outguess.org/$pkgname-$pkgver.tar.gz)
source=("http://ftp.mirrorservice.org/sites/ftp.wiretapped.net/pub/security/steganography/outguess/outguess-$pkgver.tar.gz")
md5sums=('321f23dc0badaba4350fa66b59829064')

build() {
    cd "$pkgname"
    ./configure --prefix=/usr
    make
}

package() {
    cd "$pkgname"
    mkdir -p "$pkgdir/usr/"{bin,man/man1}
    make prefix="$pkgdir/usr" install
}

# Maintainer: Paul Roe < pogues at roe dot me >
pkgname=xchainkeys
pkgver=0.11
pkgrel=1
pkgdesc="A standalone X11 program to create chained key bindings"
arch=('x86_64')
url="http://henning-liebenau.de/xchainkeys/"
license=('GPL3')
depends=('libx11')
makedepends=('p7zip')
provides=("$pkgname")
source=('https://github.com/hbekel/xchainkeys/archive/refs/heads/master.zip')
sha256sums=('9a20fe575d2060b55c5c45e1ed04b576a8444ed67688e13a0dd353fde3e00019')


build() {
    cd "$srcdir/$pkgname-master"
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/$pkgname-master"
    make DESTDIR="$pkgdir" install
}


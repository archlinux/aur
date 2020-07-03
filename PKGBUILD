# Maintainer: Steve Engledow <steve@offend.me.uk>
pkgname=xbindkeys-git
pkgrel=2
pkgver=v1.8.7.r1.g75909d9
pkgdesc='xbindkeys is a program that allows you to launch shell commands with your keyboard or your mouse under X Windows'
url='https://www.nongnu.org/xbindkeys/xbindkeys.html'
arch=(any)
license=('GPL2')
depends=(
    'guile'
    'libx11'
)
optdepends=(
    'tk'
)
makedepends=('git')
source=('git+https://git.savannah.nongnu.org/git/xbindkeys.git')
sha256sums=('SKIP')
provides=('xbindkeys')

pkgver() {
    cd xbindkeys
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd xbindkeys
    ./configure --prefix=/usr
    make
}

package() {
    cd xbindkeys
    make install prefix="$pkgdir/usr/"
}

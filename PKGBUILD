# Maintainer: Steve Engledow <steve@offend.me.uk>
pkgname=xbindkeys-git
pkgver=git
pkgrel=1
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

build() {
    cd xbindkeys
    ./configure --prefix=/usr
    make
}

package() {
    cd xbindkeys
    make install prefix="$pkgdir/usr/"
}

# Maintainer : Thomas Steinholz <tsteinholz@protonmail.com>

pkgname=blackjack-git
pkgver=1.0.0
pkgrel=1
pkgdesc="A fun little game of Black Jack."
arch=('i686' 'x86_64')
url="https://github.com/tsteinholz/BlackJack"
license=('MIT')
groups=('')
depends=('allegro>=5.0.11-1')
md5sums=('SKIP')
source=('git+http://github.com/tsteinholz/BlackJack')

build() {
    cd "$srcdir/BlackJack"
    cmake .
    make
}

package() {
    cd "$srcdir/BlackJack"
    make install
    cp "$srcdir/BlackJack/res" /usr/local/games/BlackJack
}

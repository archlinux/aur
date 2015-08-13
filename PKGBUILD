# Contributor: Collin 'Fwirt' Skiles <sploopby at gmail dot com>
# Maintainer: Brian "saikobee" Mock <mock.brian at gmail dot com>
# Maintainer: Carlos Solis <csolisr at gmail dot com>
pkgname=sfxr
pkgver=1.2.1
pkgrel=4
pkgdesc="Random sound effect generator for games, etc."
arch=('i686' 'x86_64')
url="http://www.drpetter.se/project_sfxr.html"
license=('MIT')
depends=('gtk2' 'sdl' 'hicolor-icon-theme')
install=sfxr.install
source=(http://www.drpetter.se/files/$pkgname-sdl-$pkgver.tar.gz)
md5sums=('794f18f5c527a344c7366687aa634d71')

build() {
    cd "$srcdir/$pkgname-sdl-$pkgver"
    # Uncomment below and change the dependences
    # if you plan to use GTK3 instead of GTK2
    # sed -i 's|GTK=3.0|GTK=2.0|' Makefile
    make DESTDIR=$pkgdir || return 1
}

package() {
  cd "$srcdir/sfxr-sdl-$pkgver"
  make DESTDIR="$pkgdir" install
}

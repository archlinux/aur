# Maintainer: houkime <houkime at protonmail.com>

pkgname=guile-chickadee
_name=chickadee
pkgver=0.4.0
pkgrel=1
pkgdesc='a game development toolkit for Guile Scheme'
arch=(any)
license=(GPL3)
depends=('guile>=2.1.4' 'guile-sdl2' 'guile-opengl')
provides=('guile-chickadee')
conflicts=('guile-chickadee')
url=https://dthompson.us/projects/chickadee.html
source=("https://files.dthompson.us/chickadee/chickadee-$pkgver.tar.gz")
md5sums=('2c1474626f13e4ac62a512d989512684')


build(){
  cd "$srcdir/$_name-$pkgver"
  autoreconf -vif
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_name-$pkgver"
  make DESTDIR=$pkgdir install
}
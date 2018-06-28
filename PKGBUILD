# Contributor: grimi
# Maintainer: grimi

_commit=fce85d1
pkgname=mjwm
pkgver=4.0.0+$_commit
pkgrel=1
pkgdesc="mjwm creates JWM application menu from (freedesktop) desktop files"
arch=('x86_64')
url="https://github.com/chiku/mjwm"
license=('GPL2')
depends=('jwm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/chiku/$pkgname/archive/$_commit.tar.gz")
sha256sums=('0aa7969832033a5f559e583cffffdb57644bf7848033b5a2b7e33ba1cf12f832')


build() {
  cd $pkgname-$_commit*
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$_commit*
  make DESTDIR="$pkgdir/" install
}


# vim:set ts=2 sw=2 sts=2 et:

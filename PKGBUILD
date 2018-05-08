# Maintainer: Dan Elkouby <streetwalrus@codewalr.us>

_pkgname=keynav
pkgname=$_pkgname-enhanced
pkgrel=1
pkgver=20180508
pkgdesc="Ingenious and fast way to move the mouse pointer on the screen with keystrokes, with a few patches"
arch=('i686' 'x86_64')
url="https://github.com/Streetwalrus/keynav"
license=('BSD')
depends=('xdotool')
makedepends=('git' 'perl')
provides=('keynav')
conflicts=('keynav')
source=("https://github.com/Streetwalrus/keynav/archive/$pkgver.tar.gz")
md5sums=('f21835f86241457bc5c0e6e056cb2867')

build(){
  cd $_pkgname-$pkgver
  make keynav
  make keynav.1
}

package(){
  cd $_pkgname-$pkgver
  install -D keynav "$pkgdir/usr/bin/keynav"
  install -D keynavrc "$pkgdir/etc/keynav/keynavrc"
  install -D keynav.1 "$pkgdir/usr/share/man/man1/keynav.1"
}

# vim:set ts=2 sw=2 et:

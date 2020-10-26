# Maintainer: Benoît Rouits <brouits at free dor fr>
pkgname=qliquidsfz-git
_pkgname=qliquidsfz
pkgver=0.1.3
_pkgver=0.1.3
pkgrel=1
pkgdesc="Simple LiquidSFZ synthesizer GUI."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/be1/qliquidsfz"
license=('GPL')
depends=('jack' 'liquidsfz' 'qt5-base')
#conflicts=('qliquidsfz')
source=("$_pkgname-$_pkgver.tar.gz::https://github.com/be1/$_pkgname/archive/$_pkgver.tar.gz")
sha512sums=('SKIP')

build() {
  cd "$srcdir/$_pkgname-$_pkgver"
  qmake -config release
  make
}

package() {
  cd "$srcdir/$_pkgname-$_pkgver"
  install -Dm755 qliquidsfz $pkgdir/usr/bin/qliquidsfz
  install -Dm644 qliquidsfz.png $pkgdir/usr/share/pixmaps/qliquidsfz.png
  install -Dm644 qliquidsfz.desktop $pkgdir/usr/share/applications/qliquidsfz.desktop
}

# vim:set ts=2 sw=2 et:

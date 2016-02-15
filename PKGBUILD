# Contributer: Raphael Dümig <raphael[AT]duemig-neufahrn[DOT]de>
# Maintainer: Brian "Beej" Hall <beej@beej.us>
pkgname=fgo
pkgver=1.5.5
pkgrel=1
pkgdesc="FGo! is a fast and simple GUI-launcher for FlightGear flight simulator, written in python"
arch=('any')
url="http://sites.google.com/site/erobosprojects/flightgear/add-ons/fgo"
license=('GPL')
depends=('python2' 'python-imaging' 'tcl' 'tk')
makedepends=()
source=(fgo-run https://sites.google.com/site/erobosprojects/flightgear/add-ons/fgo/download/$pkgname-$pkgver.tar.gz)
sha256sums=('3b0ab65fd5647d15a9f0bc6c82ff7ca69ec657bd2d1651116f1ecda88b7cd67c'
            '5d35b65da65d2ffbb747e4c150db7f5f489f0bc22aaff7df5a087b3b39b128b9')

package() {
  cd "$srcdir/$pkgname"

  mkdir -p $pkgdir/usr/share/$pkgname
  mkdir -p $pkgdir/usr/share/doc/$pkgname
  mkdir -p $pkgdir/usr/share/applications
  mkdir -p $pkgdir/usr/share/icons
  mkdir -p $pkgdir/usr/bin

  # Put most everything in share
  cp -r data fgo src $pkgdir/usr/share/$pkgname

  # Copy docs
  cp -r docs $pkgdir/usr/share/doc/$pkgname

  # Install desktop file 
  cp share/${pkgname}.desktop $pkgdir/usr/share/applications

  # Install icons
  cp -r share/icons/256x256/fgo.png $pkgdir/usr/share/icons

  # Install binary
  cp ../fgo-run $pkgdir/usr/bin/fgo
}

# vim:set ts=2 sw=2 et:

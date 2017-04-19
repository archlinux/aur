# Maintainer: Jiří Prokop <jprokop@synaptiko.cz>

_name=xrectsel
_ver=0.3.3
pkgname=xrectsel-compton
pkgver=${_ver//-/}
pkgrel=1
pkgdesc="print the geometry of a rectangular screen region with continuos redraw to make it work under compton"
arch=(i686 x86_64)
url="https://github.com/synaptiko/xrectsel"
license=(GPL3)
conflicts=('xrectsel' 'ffcast<1:2.2.0')  # ffcast used to ship /usr/bin/xrectsel
depends=(libx11)
makedepends=(autoconf automake)
source=("https://github.com/synaptiko/$_name/archive/$_ver.tar.gz")
sha256sums=('b2d10397051ceb11e0c5e4c38398bfc04d8f6659300afb94e80f39dfd12ac256')

prepare() {
  cd "$_name-$_ver"
  ./bootstrap
}

build() {
  cd "$_name-$_ver"
  ./configure --prefix /usr
  make
}

package() {
  cd "$_name-$_ver"
  make DESTDIR="$pkgdir" install
}

# vim:st=2:sw=2:et:

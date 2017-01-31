# Maintainer: David Pflug <david at pflug.email>
pkgname=graphscad
pkgver=1.0.0
pkgrel=1
pkgdesc="An OpenSCAD-based Nodal editor to create customizable objects for 3D printing"
arch=('i686' 'x86_64')
url="http://graphscad.blogspot.com/"
license=('GPL')
source=("http://${pkgname}.free.fr/${pkgname}_ubu_v${pkgver}.zip")
sha256sums=('6c6733f799aeca55a62bb8266656994b2cc21c9cd69ecd14e1d835a8c5271fdd')
depends=('zlib' 'python')

package() {
  cd "$srcdir/${pkgname}_ubu_v${pkgver}"

  install -D -m755 graphscad "$pkgdir/opt/graphscad/graphscad"
  mkdir -p "$pkgdir/usr/bin"
  ln -s /opt/graphscad/graphscad "$pkgdir/usr/bin/graphscad"
  cp -R display.scad examples graphscadsettings icons plugins "$pkgdir/opt/graphscad/"
}

# vim:set ts=2 sw=2 et:

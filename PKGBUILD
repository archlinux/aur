# Maintainer: David Pflug <david at pflug.email>
pkgname=graphscad
pkgver=1.0.2
pkgrel=1
pkgdesc="An OpenSCAD-based Nodal editor to create customizable objects for 3D printing"
arch=('i686' 'x86_64')
url="http://graphscad.blogspot.com/"
license=('GPL')
source=("http://${pkgname}.free.fr/${pkgname}_ubu_v${pkgver}.zip")
sha256sums=('f963f28be004e788b9ba4582c77d9302570809a48af1d1bf462ebf22f0fae17b')
urdepends=('zlib' 'python')

package() {
  cd "$srcdir/${pkgname}_ubu_v${pkgver}"

  install -D -m755 graphscad "$pkgdir/opt/graphscad/graphscad"
  mkdir -p "$pkgdir/usr/bin"
  ln -s /opt/graphscad/graphscad "$pkgdir/usr/bin/graphscad"
  cp -R display.scad examples graphscadsettings icons plugins "$pkgdir/opt/graphscad/"
}

# vim:set ts=2 sw=2 et:

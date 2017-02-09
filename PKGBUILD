# Maintainer: David Pflug <david at pflug.email>
pkgname=graphscad
pkgver=1.0.3
pkgrel=2
pkgdesc="An OpenSCAD-based Nodal editor to create customizable objects for 3D printing"
arch=('i686' 'x86_64')
url="http://graphscad.blogspot.com/"
license=('GPL')
source=("http://${pkgname}.free.fr/${pkgname}_ubu_v${pkgver}.zip")
sha256sums=('85edb9eca65690d3ba07ba80c2d5af90251161ea3091ff42d8a58d1272f39a8d')
depends=('zlib' 'python')

package() {
  cd "$srcdir/${pkgname}_ubu_v${pkgver}"

  install -D -m755 graphscad "$pkgdir/opt/graphscad/graphscad"
  mkdir -p "$pkgdir/usr/bin"
  ln -s /opt/graphscad/graphscad "$pkgdir/usr/bin/graphscad"
  cp -R examples_graphscad graphscadsettings icons plugins "$pkgdir/opt/graphscad/"
}

# vim:set ts=2 sw=2 et:

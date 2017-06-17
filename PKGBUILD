# Maintainer: David Pflug <david at pflug.email>
pkgname=graphscad
pkgver=1.0.10
pkgrel=1
pkgdesc="An OpenSCAD-based Nodal editor to create customizable objects for 3D printing"
arch=('i686' 'x86_64')
url="http://graphscad.blogspot.com/"
license=('GPL')
source=("http://${pkgname}.free.fr/${pkgname}_ubu_v${pkgver}.zip")
sha256sums=('64ee3f732ebe113f86fa03e479bb4ef3a29e9d8cc857e3fb1b1f1a861658208c')
depends=('zlib' 'python')

package() {
  cd "$srcdir/${pkgname}_ubu_v${pkgver}"

  install -D -m755 graphscad "$pkgdir/opt/graphscad/graphscad"
  mkdir -p "$pkgdir/usr/bin"
  ln -s /opt/graphscad/graphscad "$pkgdir/usr/bin/graphscad"
  cp -R graphscadfiles graphscadsettings icons plugins userplugins "$pkgdir/opt/graphscad/"
}

# vim:set ts=2 sw=2 et:

# Maintainer: Hans-Nikolai Viessmann <hans @ viess.mn>

pkgname='mosaic-ck'
pkgver=2.7ck11
pkgrel=1
pkgdesc="One of the first graphical web browsers (unsupported port)"
url='http://www.floodgap.com/retrotech/machten/mosaic/'
license=('custom')
arch=('x86_64')
depends=('openmotif' 'libjpeg' 'libpng' 'libxmu' 'libxpm' 'zlib')
source=("http://www.floodgap.com/retrotech/machten/mosaic/mosaic27ck11-src.zip")
md5sums=('85fd21914c1e0f3488c134a83dedb6bf')
provides=('mosaic')
conflicts=('ncsa-mosaic-git')

build() {
  cd mosaic-ck
  make linux
}

package() {
  cd mosaic-ck
  install -Dm0755 "src/Mosaic"              "$pkgdir/usr/bin/Mosaic"
  install -Dm0644 "desktop/Mosaic.png"      "$pkgdir/usr/share/icons/Mosaic.png"
  install -Dm0644 "desktop/Mosaic.desktop"  "$pkgdir/usr/share/applications/Mosaic.desktop"
  # license
  install -Dm0644 "COPYRIGHT"               "$pkgdir/usr/share/licenses/$pkgname/COPYRIGHT"
}

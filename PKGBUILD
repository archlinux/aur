# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=cropgui
arch=('any')
pkgver=0.4
pkgrel=2
pkgdesc="a simple tool for lossless jpeg cropping"
license=('GPL')
url="https://github.com/jepler/cropgui"
depends=('libjpeg' 'python-pillow' 'imagemagick' 'pygtk' 'perl-image-exiftool')
source=("https://github.com/jepler/cropgui/archive/v${pkgver}.tar.gz" "python3_fix.patch")
md5sums=('a761991bf98793da29390f960dffe9a2'
         '648252816c414e010193e21069cc163a')

prepare() {
  patch -p1 -i "${srcdir}/python3_fix.patch"
}

package() {
  cd $srcdir/$pkgname-$pkgver
  ./install.sh -f gtk -t $pkgdir -p /usr -P /usr/bin/python
}

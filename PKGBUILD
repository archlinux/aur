# Maintainer: OS Hazard <oshazard+aur@gmail.com>

pkgname=gtkdialog-examples
pkgver=0.1.1
pkgrel=2
pkgdesc="Sample projects: pfeme, pfontview, playmusic"
arch=('any')
url="http://code.google.com/p/gtkdialog/"
license=("GPL")
depends=('gtkdialog')
source=(https://github.com/oshazard/gtkdialog-examples/raw/master/pfeme-0.1.1.tar.gz
	https://github.com/oshazard/gtkdialog-examples/raw/master/pfontview-0.1.3.tar.gz
	https://github.com/oshazard/gtkdialog-examples/raw/master/playmusic-0.1.8.tar.gz)
md5sums=('a09ecfb90dc9f16702d6a1a9f228d65b' 
	'be079eed34073305ffcd5ea664f9fdaa' 
	'c98c861e52378def443e768fb2946992')

_samples="pfeme-$pkgver pfontview-0.1.3 playmusic-0.1.8";

build() {
  cd $srcdir
  for sample in $_samples; do
    cd "$sample"
    msg "Building $sample..."
    make
    cd ..
  done;
}

package() {
  cd $srcdir
  for sample in $_samples; do
    cd "$sample"
    msg "Building $sample..."
    make DESTDIR=$pkgdir UPDATE_ICON_CACHE=true install
    cd ..
  done;
}


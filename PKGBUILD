# Maintainer: Jefferson Gonzalez <jgmdev@gmail.com>
# Contributor: SpepS <dreamspepser at yahoo dot it>
# Contributor: farid <farid@archlinux-br.org>

_v=0.1.6-pre1
pkgname=cmyktool
pkgver=0.1.6_pre1
pkgrel=1
pkgdesc="Utility intended to build on the functionality of my old CMYK separation plugin for the GIMP."
arch=('i686' 'x86_64')
url="http://www.blackfiveimaging.co.uk/index.php?article=02Software%2F05CMYKTool"
license=('GPL')
depends=('lcms' 'gtk2' 'netpbm' 'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('gawk')
install="$pkgname.install"
source=("http://www.blackfiveimaging.co.uk/cmyktool/$pkgname-$_v.tar.gz")
md5sums=('84f42d2039e095a93f9a1bee29032f6f')

build() {
  cd "$srcdir/$pkgname-$_v"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$_v"

  make DESTDIR="$pkgdir/" install
}
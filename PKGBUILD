# Maintainer: Remy Kaldawy <remykaldawy@gmail.com>
pkgname=gifpaper
pkgver=1.2.2.r0.g2ea47fe
pkgrel=1
pkgdesc="Gif wallpapers with X11"
arch=('x86_64')
url="https://gitlab.com/rkaldawy/gifpaper"
license=('GPL3')
groups=()
depends=( 'imlib2>=1.5.1'
          'libx11>=1.6.7'
          'libpng>=1.6.37'
          'ffmpeg>=1.4.1' )
makedepends=('git')
source=(git+https://gitlab.com/rkaldawy/gifpaper.git)
md5sums=('SKIP') #autofill using updpkgsums

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
}

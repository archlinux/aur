# Contributor: Kyle Keen <keenerd@gmail.com>
pkgname=v4l2vd
pkgver=2010.03.29
pkgrel=1
pkgdesc="Route video output to V4L2 input."
arch=('i686' 'x86_64')
url="http://v4l2vd.sourceforge.net/"
license=('GPL')
#depends=()
# cvs tarball
source=(http://v4l2vd.cvs.sourceforge.net/viewvc/v4l2vd/?view=tar)
md5sums=('1f411d8baebd6249ecc3298cae457b43')
# version 0.2, very broken
#source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz)
#md5sums=('be2dcb11b01a0f7f8128cc90c7aa5055')

build() {
  cd "$srcdir/$pkgname/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname/$pkgname"
  mkdir -p "$pkgdir"/lib/modules/$(uname -r)/kernel/drivers/misc
  cp v4l2vd.ko "$pkgdir"/lib/modules/$(uname -r)/kernel/drivers/misc/
}



# Maintainer: <clu@eeviac>

pkgname=montage
pkgver=4.0
pkgrel=1
pkgdesc="An astronomical image mosaic engine"
arch=('i686' 'x86_64')
url="http://montage.ipac.caltech.edu/"
license=('custom')
depends=()
makedepends=()
provides=()
conflicts=()
source=("http://montage.ipac.caltech.edu/download/Montage_v$pkgver.tar.gz")
sha1sums=('e41f95b8586b721780e30146ecf3936a6ddf93f8')

build() {
  cd $srcdir/montage
  make
}

package() {
  cd $srcdir/montage
  
  # The following is used because the montage developers
  # have not included an install method in their Makefile
  mkdir -p $pkgdir/usr/bin
  install -Dm755 bin/* $pkgdir/usr/bin

  #custom license...
  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  install -Dm644 $srcdir/montage/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

  #Find docs at:
  #http://montage.ipac.caltech.edu/docs/
}

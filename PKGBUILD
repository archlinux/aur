# Maintainer: <clu@eeviac>

pkgname=montage
pkgver=3.3
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
sha1sums=('5410b72243058bce4ae37e07020980d1c8629255')

build() {
  cd $srcdir/Montage_v$pkgver
  make
}

package() {
  cd $srcdir/Montage_v$pkgver
  
  # The following is used because the montage developers
  # have not included an install method in their Makefile
  mkdir -p $pkgdir/usr/bin
  install -Dm755 bin/* $pkgdir/usr/bin

  #custom license...
  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  install -Dm644 $srcdir/Montage_v$pkgver/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

  #Find docs at:
  #http://montage.ipac.caltech.edu/docs/
}

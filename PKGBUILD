# Maintainer: Nils Brause <nilschrbrause@gmail.com>
# Previous Maintainer: Dustin Wilhoit <dustin@wilhoitclan.com>
# Original Maintainer: Phillip Smith <pkgbuild@phs.id.au> - http://github.com/fukawi2/aur-packages

pkgname=stenc
pkgver=2.0.1
pkgrel=1
pkgdesc="SCSI Tape Encryption Manager"
arch=('i686' 'x86_64')
license=('GPLv2')
url="https://github.com/scsitape/stenc"
source=("https://github.com/scsitape/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('f4ce697328bf49ec139e3467ae2ca3fbb90fc0b48ff78269339a585f672b15a8d233c6fd44f67c49d31e7717692341a923e87ab852c7bdb95f8f0276186fcc9f')
makedepends=('pandoc')

build() {
  cd "$srcdir"/$pkgname-$pkgver

  autoreconf --install
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver

  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:

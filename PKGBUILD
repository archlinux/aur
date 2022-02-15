# Maintainer: Dustin Wilhoit <dustin@wilhoitclan.com>
# Original Maintainer: Phillip Smith <pkgbuild@phs.id.au> - http://github.com/fukawi2/aur-packages

pkgname=stenc
pkgver=1.0.8
pkgrel=2
pkgdesc="SCSI Tape Encryption Manager"
arch=('i686' 'x86_64')
license=('GPLv2')
url="https://github.com/scsitape/stenc"
source=("https://github.com/scsitape/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('4fd882861d248cf59cde1782833bd3e4f7e01e8b6c00424c55f26454a620510b22de0d42f2d7f6c4e67c2b277776a174fe687756a75f410026fda55554f9dc87')

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

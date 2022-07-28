# Maintainer: Dustin Wilhoit <dustin@wilhoitclan.com>
# Original Maintainer: Phillip Smith <pkgbuild@phs.id.au> - http://github.com/fukawi2/aur-packages

pkgname=stenc
pkgver=1.1.1
pkgrel=1
pkgdesc="SCSI Tape Encryption Manager"
arch=('i686' 'x86_64')
license=('GPLv2')
url="https://github.com/scsitape/stenc"
source=("https://github.com/scsitape/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('89eb1da2391be207e23d4e3cc6563405272eeb456b59360e92fbeca063badcfcf4c37fc814af59803707006e5c04e43e18755e1d30b0f3b3020a7645396db1a6')

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

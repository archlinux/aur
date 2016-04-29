# Maintainer: Steffen Weber <-boenki-gmx-de->
# Contributor: schuay <jakob.gruber@gmail.com>
# Contributor: rennero <rennero@bastardi.net>

pkgname=hasciicam
pkgver=1.3
pkgrel=2
pkgdesc="Renders video input as ascii (to the terminal, textfile, or live webpage)"
url="http://ascii.dyne.org/"
depends=('aalib' 'libv4l')
arch=('i686' 'x86_64')
source=("https://files.dyne.org/$pkgname/${pkgname}_$pkgver.tar.gz")
md5sums=('4d77c6a4cf6e2b1474d5fec0ff450b80')
license=('GPL3')

build() {
  cd ${pkgname}_$pkgver
  ./configure --prefix="$pkgdir/usr" --mandir="$pkgdir/usr/share/man"
  make
}

package() {
  cd ${pkgname}_$pkgver
  make install

  cd "$pkgdir/usr/share"
  mv icons pixmaps
  rm -r menu
}

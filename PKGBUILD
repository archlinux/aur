# Maintainer: Rastislav Barlik <barlik.arch at gmx dot com>
# Contributor: Jeff Parent <jecxjo@sdf.lonestar.org>
pkgname=cutecw
pkgver=1.0
pkgrel=1
epoch=
pkgdesc="Learn CW using the Koch Method"
arch=('i686' 'x86_64')
url=""
license=('GPL')
depends=('qt4' 'pulseaudio')
source=("http://www.hamtools.org/$pkgname/releases/$pkgname-$pkgver.tar.gz")
noextract=()
validpgpkeys=()
sha256sums=('d0267dafe80047fb82ff387fc9cc4451f3f9a1b0f952eee66f0a82fa092c1146')

build() {
  cd "$pkgname-$pkgver"
  qmake-qt4
  make
}

package() {
  cd "$pkgname-$pkgver"
  install -d -m 755 "$pkgdir/usr/bin"
  install -m 755 cutecw "$pkgdir/usr/bin/cutecw"
}

# Maintainer: Rastislav Barlik <barlik.arch at gmx dot com>
# Contributor: Jeff Parent <jecxjo@sdf.lonestar.org>
pkgname=cutecw
pkgver=2.0
pkgrel=3
epoch=
pkgdesc="Learn CW using the Koch Method"
arch=('i686' 'x86_64')
url=""
license=('GPL')
depends=('qt6-base' 'pulseaudio')
source=("http://www.hamtools.org/$pkgname/releases/$pkgname-$pkgver.tar.gz")
noextract=()
validpgpkeys=()
sha256sums=('d79ce2a9e0ab2e2c958ea33b5f43a2e000be4d0afd7282847e200062fa44129e')

build() {
  cd "CuteCW-$pkgver"
  qmake6
  make
}

package() {
  cd "$pkgname-$pkgver"
  install -d -m 755 "$pkgdir/usr/bin"
  install -m 755 cutecw "$pkgdir/usr/bin/cutecw"
}

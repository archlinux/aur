# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>

pkgname=ski
pkgver=6.9
pkgrel=1
pkgdesc='Ski game for the console'
arch=('any')
depends=('python2')
url='http://www.catb.org/esr/ski/'
license=('GPL')
options=('zipman')
source=("http://www.catb.org/esr/ski/ski-$pkgver.tar.gz")
md5sums=('6ccf2ebcc74d75d7d434cb22875f4032')

build() {
  cd "$pkgname-$pkgver"

  sed 's:python:python2:' -i ski
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm644 ski.6 "$pkgdir/usr/share/man/man6/ski.6"
  install -Dm755 ski "$pkgdir/usr/bin/ski"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:

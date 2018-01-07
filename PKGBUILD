# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=recoverdm
pkgver=0.20
pkgrel=4
pkgdesc="helps to recover disks with bad sectors"
arch=('x86_64')
url="http://www.vanheusden.com/recoverdm/"
license=('GPL')
depends=(glibc)
source=(https://www.vanheusden.com/recoverdm/${pkgname}-${pkgver}.tgz)
sha256sums=('0fd4bc3ce4360a12f69c1440bc31ffd29f0e88f38b9279fb4a783a173d4f6f4c')

build() {
  cd "$srcdir"/$pkgname-${pkgver}
  make
}

package() {
  cd "$srcdir"/$pkgname-${pkgver}
  install -Dm0755 mergebad "$pkgdir"/usr/bin/mergebad
  install -Dm0755 recoverdm "$pkgdir"/usr/bin/recoverdm
}

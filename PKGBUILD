# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=dxpc
pkgver=3.9.2
pkgrel=6
pkgdesc="Differential X Protocol Compressor"
arch=('x86_64')
url="http://www.vigor.nu/dxpc/"
license=('GPL')
depends=('lzo' 'gcc-libs')
makedepends=('xproto')
source=(http://www.vigor.nu/dxpc/dxpc-$pkgver.tgz)
md5sums=('e69f58c4acc34c6746a0e5ab17bf8d0f')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --mandir='${prefix}/share/man'
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make prefix="$pkgdir/usr" install
}

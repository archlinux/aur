# Maintainer: D. Murphy (archerdm)

pkgname=cackey
pkgver=0.7.11
pkgrel=1
pkgdesc="CACKey PKCS#11 Provider for US Department of Defense CACs"
arch=('x86_64')
url="https://cackey.rkeene.org/fossil/home"
license=('multiple')
depends=('glibc' 'zlib' 'pcsclite')
source=("http://cackey.rkeene.org/download/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('0ed459814fb4753f6e5fa80034c55d1b312f55f88ee7317446dff49fa6e570f3')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=$pkgdir/usr
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make install
}

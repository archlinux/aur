# Maintainer: xryptor <xryptor at gmail dot com>

pkgname=dirac
pkgver=1.0.2
pkgrel=1
pkgdesc='open source video codec'
arch=('i686' 'x86_64')
url='https://sourceforge.net/projects/dirac/files/dirac-codec/'
license=('LGPL')
makedepends=('gcc' 'make')
optdepends=('dot2tex' 'haskell-dotgen' 'texlive-core' 'dblatex' 'doxygen')
source=("https://downloads.sourceforge.net/project/dirac/dirac-codec/Dirac-${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha1sums=('895aaad832a54b754e58f77c87d38c0c37752b0b')
md5sums=('a57c2c5e58062d437d9ab13dffb28f0f')
build() {
  cd "$srcdir/$pkgname-$pkgver"
  CFLAGS="-Wno-unused-but-set-variable "
  CFLAGS+="-Wno-narrowing "
  CFLAGS+="-Wno-stringop-truncation "
  CFLAGS+="-Wno-deprecated-copy "
  CFLAGS+="-Wno-deprecated-declarations"
  CXXFLAGS="${CFLAGS}"
  ./configure --prefix=/usr
  make
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

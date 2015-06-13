# PKGBUILD maintained by Andreas Obergrusberger <tradiaz@yahoode>
# PKGBUILD update by Xavier corredorl (epsilom) 2009

pkgname=elektra
pkgver=0.8.9
pkgrel=2
pkgdesc="Elektra is a universal hierarchical configuration store"
url="http://freedesktop.org/wiki/Software/Elektra"
license="BSD"
arch=('i686' 'x86_64')
depends=('libxml2')
makedepends=('docbook-xsl' 'texlive-latexextra' 'cmake')
source=(ftp://ftp.markus-raab.org/elektra/releases/$pkgname-$pkgver.tar.gz)
md5sums=('001c4ec67229046509a0cb9eda223dc6')

build() {
  cd ${srcdir}/$pkgname-$pkgver
  rm -rf build
  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DQT_QMAKE_EXECUTABLE=qmake4 ..
  make clean 
  make
}

package() {
  cd ${srcdir}/$pkgname-$pkgver/build
  make DESTDIR=${pkgdir} install
}

# PKGBUILD maintained by Andreas Obergrusberger <tradiaz@yahoode>
# PKGBUILD update by Xavier corredorl (epsilom) 2009

pkgname=elektra
pkgver=0.8.15
pkgrel=2
pkgdesc="Elektra is a universal hierarchical configuration store"
url="http://freedesktop.org/wiki/Software/Elektra"
license=("BSD")
arch=('i686' 'x86_64')
depends=('libxml2')
makedepends=('docbook-xsl' 'texlive-latexextra' 'cmake' 'doxygen')
source=(ftp://ftp.markus-raab.org/elektra/releases/$pkgname-$pkgver.tar.gz)
md5sums=('33ec1e5982fb7fbd8893bf7b579b80f0')

build() {
  cd ${srcdir}/$pkgname-$pkgver
  rm -rf build
  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make clean 
  make
}

package() {
  cd ${srcdir}/$pkgname-$pkgver/build
  make DESTDIR=${pkgdir} install
}

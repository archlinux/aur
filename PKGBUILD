# Maintainer: Ismo Toijala <ismo.toijala@gmail.com>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Francois Boulogne <fboulogne at april dot org>

pkgname=minuit2
pkgver=5.34.14
_pkgver=5_34_14
pkgrel=1
pkgdesc="A physics analysis tool for function minimization"
arch=('i686' 'x86_64')
url="http://lcgapp.cern.ch/project/cls/work-packages/mathlibs/minuit/"
license=('LGPL')
depends=('gcc-libs')
options=('!libtool')
source=("http://www.cern.ch/mathlibs/sw/${_pkgver}/Minuit2/Minuit2-${pkgver}.tar.gz")

build() {
  cd "${srcdir}/Minuit2-${pkgver}"
  ./configure --prefix=/usr --disable-openmp
  make
}

package() {
  cd "${srcdir}/Minuit2-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

md5sums=('7fc00378a2ed1f731b719d4837d62d6a')

# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=python2-bento
pkgver=0.1.1
pkgrel=1
pkgdesc="Bento is a no-nonsense packaging tool solution for python softwares."
url="http://cournape.github.com/Bento/"
arch=('i686' 'x86_64')
license=('BSD')
depends=( 'python2')
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(http://pypi.python.org/packages/source/b/bento/bento-${pkgver}.tar.gz)
md5sums=('6e6013e22c80811b4fa770023d45fc60')

build() {
  cd ${srcdir}/bento-${pkgver}
  python2 bootstrap.py
  ./bentomaker configure --prefix=/usr --destdir=${pkgdir}
}

package() {
  cd ${srcdir}/bento-${pkgver}
  ./bentomaker install
}

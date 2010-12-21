# Maintainer:
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>
# Contributor: Cilyan Olowen <gaknar@gmail.com>

pkgname=python-nose
pkgver=1.0.0
pkgrel=1
pkgdesc="A discovery-based unittest extension"
arch=('any')
url="http://www.somethingaboutorange.com/mrl/projects/nose/"
license=('LGPL2')
depends=('python2-distribute')
source=("http://www.somethingaboutorange.com/mrl/projects/nose/nose-${pkgver}.tar.gz")
md5sums=('9542d4c66e04880d8144990de76e0b88')

build() {
  cd "$srcdir/nose-$pkgver"
  sed -i -e "s:man/man1:share/man/man1:g" setup.py
}

package() {
  cd "$srcdir/nose-$pkgver"
  python2 setup.py install --prefix=/usr --root=${pkgdir}
}

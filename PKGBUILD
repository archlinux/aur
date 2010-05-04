# $Id: $
# Maintainer:
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>
# Contributor: Cilyan Olowen <gaknar@gmail.com>

pkgname=python-nose
pkgver=0.11.3
pkgrel=1
pkgdesc="A discovery-based unittest extension"
arch=('any')
url="http://www.somethingaboutorange.com/mrl/projects/nose/"
license=('LGPL2')
depends=('setuptools')
source=("http://www.somethingaboutorange.com/mrl/projects/nose/nose-${pkgver}.tar.gz")
md5sums=('7f1dc53750811f78bedef9e14a4bc5a5')

build() {
  cd "$srcdir/nose-$pkgver"
  sed -i -e "s:man/man1:share/man/man1:g" setup.py
}

package() {
  cd "$srcdir/nose-$pkgver"
  python setup.py install --prefix=/usr --root=${pkgdir} || return 1
}

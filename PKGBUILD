# $Id: $
# Maintainer: Douglas Soares de Andrade <douglas@archlinux.org>
# Contributor: Cilyan Olowen <gaknar@gmail.com>

pkgname=python-nose
pkgver=0.10.4
pkgrel=3
pkgdesc="A discovery-based unittest extension."
arch=('i686' 'x86_64')
url="http://www.somethingaboutorange.com/mrl/projects/nose/"
license=('LGPL2')
depends=('python')
makedepends=('setuptools')
source=(http://www.somethingaboutorange.com/mrl/projects/nose/nose-${pkgver}.tar.gz)
md5sums=('4b4aec226d03f1d8465336a88d7183c4')

build() {
  cd "$srcdir/nose-$pkgver"
  sed -i -e "s:man/man1:share/man/man1:g" setup.py
  python setup.py install --prefix=/usr --root=$startdir/pkg || return 1
}

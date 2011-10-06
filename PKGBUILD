# Maintainer: Angel Velasquez <angvp@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>
# Contributor: Cilyan Olowen <gaknar@gmail.com>
pkgbase=python-nose
pkgname=('python-nose' 'python2-nose')
pkgver=1.1.2
pkgrel=2
pkgdesc="A discovery-based unittest extension"
arch=('any')
url="http://www.somethingaboutorange.com/mrl/projects/nose/"
license=('LGPL2')
source=("http://pypi.python.org/packages/source/n/nose/nose-${pkgver}.tar.gz")
makedepends=('python' 'python-distribute' 'python2' 'python2-distribute')
conflicts=('python2-nose')
md5sums=('144f237b615e23f21f6a50b2183aa817')

build() {
  cd "$srcdir/nose-$pkgver"
  cp -R $srcdir/nose-$pkgver $srcdir/nose2-$pkgver
  sed -i -e "s:man/man1:share/man/man1:g" setup.py
}

package_python-nose() {
  depends=('python')
  cd "$srcdir/nose-$pkgver"
  python setup.py install --prefix=/usr --root=${pkgdir}
}

package_python2-nose() {
  depends=('python2')
  cd "$srcdir/nose2-$pkgver"
  python2 setup.py install --prefix=/usr --root=${pkgdir}
}

# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=('python-munch' 'python2-munch')
pkgver='2.1.1'
pkgrel='1'
pkgdesc='A dot-accessible dictionary (a la JavaScript objects).'
arch=('any')
url='https://github.com/Infinidat/munch'
license=('Apache')
source=("git+https://github.com/Infinidat/munch#tag=$pkgver")
md5sums=('SKIP')

prepare() {
  cp -a munch{,-py2}
}

build() {
  cd "$srcdir"/munch
  python setup.py build

  cd "$srcdir"/munch-py2
  python2 setup.py build
}

package_python-munch() {
  cd "$srcdir"/munch
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-munch() {
  cd "$srcdir"/munch-py2
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:

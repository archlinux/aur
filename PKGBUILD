# Maintainer: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

pkgbase=python-py-pretty
pkgname=('python-py-pretty' 'python2-py-pretty')
pkgver=1
pkgrel=1
pkgdesc="Formats dates, numbers, etc. in a pretty, human readable format."
arch=('any')
url="https://pypi.python.org/pypi/py-pretty"
license=('unknown')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://pypi.python.org/packages/source/p/py-pretty/py-pretty-1.zip")
sha256sums=('07364e213272800864f506d454ac093ec85c645e0102a1124961c421627abd03')

prepare() {
  cp -a py-pretty-$pkgver{,-py2}
}

build() {
  cd "$srcdir"/py-pretty-$pkgver
  python setup.py build

  cd "$srcdir"/py-pretty-$pkgver-py2
  python2 setup.py build
}

package_python-py-pretty() {
  depends=('python-setuptools')

  cd py-pretty-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

package_python2-py-pretty() {
  depends=('python2-setuptools')

  cd py-pretty-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
}

# Maintainer: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

pkgbase=python-bottle-fdsend
pkgname=('python-bottle-fdsend' 'python2-bottle-fdsend')
pkgver=0.1
pkgrel=1
pkgdesc="Library for constructing responses from file descriptors"
arch=('any')
url="https://github.com/Outernet-Project/bottle-fdsend"
license=('GPL3')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://github.com/Outernet-Project/bottle-fdsend/archive/v$pkgver.tar.gz")
sha256sums=('f13c111a4ea8af6e573ffda0c72989cb8c0cc43be0424b5871eb2a7baab86c8c')

prepare() {
  cp -a bottle-fdsend-$pkgver{,-py2}
}

build() {
  cd "$srcdir"/bottle-fdsend-$pkgver
  python setup.py build

  cd "$srcdir"/bottle-fdsend-$pkgver-py2
  python2 setup.py build
}

package_python-bottle-fdsend() {
  depends=('python-bottle')

  cd bottle-fdsend-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

package_python2-bottle-fdsend() {
  depends=('python2-bottle')

  cd bottle-fdsend-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
}

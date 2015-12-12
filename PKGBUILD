# Maintainer: Dylan <dylan@flickmag.net>

pkgname=python-daemonocle
pkgver=0.8
pkgrel=3
pkgdesc="Python library for creating Unix daemons"
url="https://github.com/jnrbsn/daemonocle"
depends=('python'
         'python-click'
         'python-psutil')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/source/d/daemonocle/daemonocle-$pkgver.tar.gz")
sha256sums=('b5fd390a3cf617c9113be02097892d2a0e967d99cc4ec9926671e20e8c03520c')

prepare() {
  cd "$srcdir/daemonocle-$pkgver"
  sed -i "s|click==2.5|click|g" setup.py
  sed -i "s|psutil==2.1.1|psutil|g" setup.py
}

build() {
  cd "$srcdir/daemonocle-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/daemonocle-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}


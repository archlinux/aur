# $Id$
# Maintainer: Matthieu "Puckel_" Roisil <contact@puckel.fr>

pkgname=ngxtop
pkgver=0.0.2
pkgrel=1
pkgdesc="Real-time metrics for nginx server"
arch=('any')
url="https://github.com/lebinh/ngxtop"
license=('MIT')

depends=(
         'python2-setuptools'
         'python2-pyparsing'
         'python2-tabulate'
)
source=("http://pypi.python.org/packages/source/n/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('9758ff9c8163024a5a9b30df9fb6eedc')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  find -type f -name "*.py" -exec sed -i 's|/usr/bin/env python|/usr/bin/env python2|' {} \;
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install -O1 --skip-build --prefix=/usr --root="$pkgdir"
}

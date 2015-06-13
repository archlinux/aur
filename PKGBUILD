# Maintainer: Kyle Meyer <kyle@kyleam.com>

pkgname=wcut
pkgver=1.0.0
pkgrel=1
pkgdesc='Cut with words. Similar to the unix command line utility cut, but with words instead.'
arch=('any')
url='https://github.com/kyleam/wcut'
license=('GPL3')
depends=('python' 'python-docopt')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/w/wcut/wcut-$pkgver.tar.gz")
md5sums=('17c188f850c4e4e2fe7775d143bc7c02')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --skip-build -O1 --root="$pkgdir"
}

# Maintainer: Damien Nguyen <damien1@huawei.com>

pkgname=python-jupyter-react
_name=${pkgname#python-}

pkgver=0.1.7
pkgrel=1
pkgdesc="React component extension for Jupyter Notebooks"
arch=('any')
url="https://github.com/timbr-io/jupyter-react"
license=('MIT')
depends=('python')
makedepends=('python'
	     'python-setuptools')
checkdepends=('python')
source=("https://github.com/Huawei-HiQ/${_name}/archive/${pkgver}.tar.gz")
sha256sums=('55f7a44689d8aaa4f696ec509962ac124d199cbb6f0bd92f1920c9ad89b4cbd5')

prepare() {
  cd "$srcdir/$_name-$pkgver"
  # patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
}

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

check() {
  cd "$srcdir/$_name-$pkgver"
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -D -p -m 644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:

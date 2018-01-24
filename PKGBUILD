# Maintainer: Kelsey Maes <kelseymaes at outlook dot com>

_name=knack
pkgname=python-$_name
pkgver=0.3.1
pkgrel=1
pkgdesc="A Python command line interface framework"
arch=('any')
url="https://github.com/Microsoft/knack"
license=('MIT')
makedepends=('python-setuptools')
source=("https://github.com/Microsoft/knack/archive/${pkgver}.tar.gz")
md5sums=('5b207dfc864cf2830273ffeb3ae9469e')

build() {
  cd "$_name-$pkgver"

  python setup.py build;
}

package() {
  cd "$_name-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1

#  rm "$pkgdir"/usr/lib/python3.?/site-packages/azure/__init__.py
#  rm "$pkgdir"/usr/lib/python3.?/site-packages/azure/__pycache__/__init__.*
}

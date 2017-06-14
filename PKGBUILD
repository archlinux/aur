# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=flake8-bugbear
pkgver=17.4.0
pkgrel=1
pkgdesc='Plugin for finding likely bugs and design problems in your code.'
arch=('any')
url="https://github.com/PyCQA/flake8-bugbear"
license=('MIT')
depends=('flake8' 'python-attrs')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/f/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('f543d716ce11914390e8ef4aca932d83')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py test
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}

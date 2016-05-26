# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-rstr
pkgver=2.2.4
pkgrel=1
pkgdesc="Generate random strings in Python"
arch=('any')
depends=('python')
makedepends=('python-setuptools')
url="https://bitbucket.org/leapfrogdevelopment/rstr"
license=('BSD')
options=(!emptydirs)
source=(https://pypi.python.org/packages/34/73/bf268029482255aa125f015baab1522a22ad201ea5e324038fb542bc3706/rstr-2.2.4.tar.gz)
md5sums=('26ac863c4df7e5b75d8a9315992d9dc8')
sha256sums=('64a086a7449a576de7f40327f8cd0a7752efbbb298e65dc68363ee7db0a1c8cf')

build() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  msg2 'Building...'
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  msg2 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1
}

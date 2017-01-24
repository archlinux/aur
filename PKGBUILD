# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-pysha3
pkgver=1.0.1
pkgrel=1
pkgdesc="SHA-3 wrapper (keccak) for Python"
arch=('i686' 'x86_64')
depends=('python')
makedepends=('python-setuptools')
url="https://bitbucket.org/tiran/pykeccak"
license=('PSFL')
options=(!emptydirs)
source=(https://pypi.python.org/packages/54/cb/d41dd01f060adff284c75c4e7d13c74c2211eee444e30d1488985cc1598c/pysha3-1.0.1.tar.gz)
md5sums=('0293e3e8e788eee8da105a227c1fd062')
sha256sums=('89c334f783426da529005fb8e53b46c02e838979c04f097127a0108b01c370df')

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

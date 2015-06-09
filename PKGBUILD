# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=pyspv
pkgver=0.0.1
pkgrel=1
pkgdesc="Programmable Bitcoin SPV node in Python"
arch=('any')
depends=('openssl' 'python' 'python-bitarray')
makedepends=('python-setuptools')
url="http://pyspv.org"
license=('MIT')
source=(git+https://github.com/sarchar/pyspv)
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/sarchar/pyspv/tar.gz/v$pkgver-alpha)
sha256sums=('4f707c66474184d870aa92db9d89137b0df5e78b0127dc9f4c2f6e766a29f827')

build() {
  cd $pkgname-$pkgver-alpha

  msg 'Building...'
  python setup.py build
}

package() {
  cd $pkgname-$pkgver-alpha

  msg 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1
}

pkgname=python-asyncserial
_pkgname=asyncserial-py
# Maintainer: Patschke
pkgver=0.1.0
pkgrel=2
pkgdesc='A wrapper for the pyserial library providing an interface based on async def and await'
arch=('any')
url='https://github.com/xvzf/asyncserial-py'
license=('Apache-2.0')
depends=('python' 'python-setuptools' 'python-pyserial')
source=("https://github.com/xvzf/$_pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('2a5e452689e40199e7f2cc7eda2091e6e7bacdbc9a30d9d4e68434cca00509aa')

build() {
  cd "$_pkgname-$pkgver"

  python setup.py build
}

package() {
  cd "$_pkgname-$pkgver"

  python setup.py install --root="$pkgdir" --prefix=/usr -O1 --skip-build
}

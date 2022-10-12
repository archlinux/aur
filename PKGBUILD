# Maintainer: Bao Trinh <qubidt at gmail dot com>

pkgname=python-darker
pkgver=1.5.1
pkgrel=1
pkgdesc='Apply black reformatting to Python files only in regions changed since a given commit'
arch=('any')
url=https://github.com/akaihola/darker
license=('BSD')
depends=('python'
         'python-black'
         'python-toml')
makedepends=('python-setuptools')
optdepends=('python-isort: for sorting import statements')
source=("$pkgname-$pkgver.tar.gz::https://github.com/akaihola/darker/releases/download/${pkgver}/darker-${pkgver}.tar.gz")
sha512sums=('affde57589dcc1ec6380f5ef1acde0f6f48342ee5dcc889fae31d4b97ae6c8467e93611d6474d28d9bbb6b50e484a473bc533e5b7af5048158e49e8974efdefb')

build() {
  cd "darker-$pkgver"
  python setup.py build
}

package() {
  cd "darker-$pkgver"
  python setup.py install --optimize=1 --root="$pkgdir" --skip-build
  install -vDm 644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -vDm 644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}

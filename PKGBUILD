# Maintainer: Bao Trinh <qubidt at gmail dot com>

pkgname=python-darker
pkgver=1.4.1
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
sha512sums=('e41e672eb47a63d1f002c056ef7115f34b55e9afcefa334369ada445412426d0e549c795a5e70f391e1aa100a48bf3606bac6bcf89bbab46c30997055c2bc34a')

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

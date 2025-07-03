# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: mawcomw <mawcomw@gmail.com>

_base=dj-database-url
pkgname=python-${_base}
pkgver=3.0.1
pkgrel=1
arch=('any')
pkgdesc="Use Database URLs in your Django Application"
url="https://github.com/jazzband/${_base}"
license=('BSD-3-Clause')
depends=(python-django)
makedepends=(python-setuptools)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('73290a47e1af47cc310f1eac3a4b1a13cf7d135bbe4a9c929774f880fb48f260fd4aa03e2e4cef242bae0064b7202906ab672b4ed6cee377a8661c395785823c')

build() {
  cd "${_base}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_base}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE.txt
}

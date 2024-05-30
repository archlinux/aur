# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: mawcomw <mawcomw@gmail.com>

_base=dj-database-url
pkgname=python-${_base}
pkgver=2.2.0
pkgrel=1
arch=('any')
pkgdesc="Use Database URLs in your Django Application"
url="https://github.com/jazzband/${_base}"
license=('BSD-3-Clause')
depends=(python-django python-typing_extensions)
makedepends=(python-setuptools)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('9ce1c1dd9289b2464e140d4e9a3245b0f6694e0e74a5317f1d7a5fca4188223fd98e128dbdf00c8f2aef97ca2553807193c58ecdc1fab46aa7e66d85ee747b9c')

build() {
  cd "${_base}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_base}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE.txt
}

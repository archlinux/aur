# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: mawcomw <mawcomw@gmail.com>

_base=dj-database-url
pkgname=python-${_base}
pkgver=3.0.0
pkgrel=1
arch=('any')
pkgdesc="Use Database URLs in your Django Application"
url="https://github.com/jazzband/${_base}"
license=('BSD-3-Clause')
depends=(python-django)
makedepends=(python-setuptools)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('8e1dba3bbe7761a2295b5b752554c003fc9ca52b7c6606e47033b3f6b92c73bcfcd47dd64c33e063fef0a5b2c664baa1f387934a988f1a321a20b2f8dca34701')

build() {
  cd "${_base}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_base}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE.txt
}

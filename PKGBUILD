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
sha512sums=('107499d7c4590e4b94265db03535e5ec5019ea35229dedd913a0aa9b81257184787b0a8f9a59751c94479a2b4ffcb5ba52c439425eabd5b4cd6c1ccbaa806f03')

build() {
  cd "${_base}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_base}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE.txt
}

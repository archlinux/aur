# Maintainer: Daniel Moch <daniel@danielmoch.com>
pkgname=nncli
pkgver=0.1.0
pkgrel=2
pkgdesc="NextCloud Notes Command Line Interface"
arch=('any')
url="https://github.com/djmoch/${pkgname}"
license=('MIT')
depends=('python-urwid' 'python-requests')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/0c/65/9460a35a3e53c960fe0114658f1bccb9b7539a78ae1a46be05d3362173f8/${pkgname}-${pkgver}.tar.gz")
sha256sums=('ecf341cd143f8b8147e6970715503f3ccb8386ee8a2a2b15c37a68078e280acc')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ft=PKGBUILD ts=2 sw=2 et

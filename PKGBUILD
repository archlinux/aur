# Maintainer: Daniel Moch <daniel@danielmoch.com>
pkgname=nncli
pkgver=0.1.1
pkgrel=1
pkgdesc="NextCloud Notes Command Line Interface"
arch=('any')
url="https://github.com/djmoch/${pkgname}"
license=('MIT')
depends=('python-urwid' 'python-requests')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/22/a6/106430252b73d8dac8ca8f8aaef2404ecbff6312f53ecc1c3ebb3650c283/${pkgname}-${pkgver}.tar.gz")
sha256sums=('8e266545a499d5b8ea6d57f86ead10b07ea4166a844babbf11cebc00991f4a96')

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

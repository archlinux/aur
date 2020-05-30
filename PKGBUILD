# Maintainer: Lex Black <autumn-wind@web.de>

pkgname=ngxtop-ce
pkgver=0.0.3a7
pkgrel=1
pkgdesc="Real-time metrics for nginx server"
arch=('any')
url="https://github.com/ngxtop/ngxtop"
license=('MIT')
depends=('python-docopt' 'python-tabulate' 'python-pyparsing')
makedepends=('python-setuptools')
conflicts=('ngxtop')
provides=('ngxtop')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('417e1de0e6552a45e78b8ad07b85754590f0096adb16e8f3210e5ea46666428c')


build () {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --optimize=1 --root="${pkgdir}" --skip-build
}

# vim:set et sw=2 ts=2 tw=79:

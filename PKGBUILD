# Maintainer: Lex Black <autumn-wind@web.de>

pkgname=ngxtop-ce
pkgver=0.0.3a6
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
sha256sums=('0d0c7d99d2a542b8621d3f397e7b9870427f87402669eff3d8ef3ab61cded9fa')


build () {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --optimize=1 --root="${pkgdir}" --skip-build
}

# vim:set et sw=2 ts=2 tw=79:

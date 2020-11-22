# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=shiv
pkgver=0.4.0
pkgrel=1
pkgdesc="A command line utility for building fully self contained Python zipapps as outlined in PEP 441, but with all their dependencies included"
arch=('any')
url='https://github.com/linkedin/shiv'
license=('BSD')
depends=('python' 'python-click')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('7da29f2bd5565b80475bfcfdfca5165827c813bfee723ef43c7c4ae8e6ada2ab')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/shiv/LICENSE"
}

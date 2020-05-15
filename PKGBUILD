# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=shiv
pkgver=0.1.2
pkgrel=1
pkgdesc="A command line utility for building fully self contained Python zipapps as outlined in PEP 441, but with all their dependencies included"
arch=('any')
url='https://github.com/linkedin/shiv'
license=('BSD')
depends=('python' 'python-click')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('307b47b45707b25b82f77a52173496e86eca27d72c86642571e4cecfa355e948')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/shiv/LICENSE"
}
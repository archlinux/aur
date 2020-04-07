# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=shiv
pkgver=0.1.1
pkgrel=1
pkgdesc="A command line utility for building fully self contained Python zipapps as outlined in PEP 441, but with all their dependencies included"
arch=('any')
url='https://github.com/linkedin/shiv'
license=('BSD-2-Clause')
depends=('python-click')
makedepends=('python-setuptools')
source=("${url}/archive/${pkgver}.tar.gz")
md5sums=('8e091299c0e362f3e4bb90296324ad59')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/shiv/LICENSE"
}
# Maintainer: Aditya Sirish <aditya@saky.in>

pkgname=shiv
_pkgorg=linkedin
pkgver=0.5.1
pkgrel=1
pkgdesc="A command line utility for building fully self contained Python zipapps as outlined in PEP 441, but with all their dependencies included"
arch=('any')
url='https://github.com/linkedin/shiv'
license=('BSD')
depends=('python' 'python-click')
makedepends=('python-setuptools')
source=("git+https://github.com/${_pkgorg}/${pkgname}.git#tag=${pkgver}")
sha256sums=('SKIP')

build() {
  cd ${srcdir}/${pkgname}
  python setup.py build
}

package() {
  cd ${srcdir}/${pkgname}
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/shiv/LICENSE"
}

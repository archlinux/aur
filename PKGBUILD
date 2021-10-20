# Maintainer: Aditya Sirish <aditya@saky.in>

pkgname=shiv
pkgver=0.5.1
pkgrel=2
pkgdesc="A command line utility for building fully self contained Python zipapps as outlined in PEP 441, but with all their dependencies included"
arch=('any')
url='https://github.com/linkedin/shiv'
license=('BSD')
depends=('python' 'python-click')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/${pkgver}.tar.gz")
sha256sums=('386e73e8ef20615d577c50562748ca91d10fa229273130d73b438d4f73cdf803')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/shiv/LICENSE"
}

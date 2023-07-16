_pkgname='pathvalidate'
pkgname=python-$_pkgname
pkgver=3.1.0
pkgrel=1
pkgdesc='Sanitize/validate strings in filenames/file-paths/etc'
arch=('any')
url='https://github.com/thombashi/pathvalidate'
license=('MIT')
depends=('python' 'python-click')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/thombashi/pathvalidate/archive/v$pkgver.tar.gz")
sha256sums=('c215389975c007638bf18f44afdf4ed118543fa8ae0ff902c1aa50a8b009044f')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dvm644 'README.rst' -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

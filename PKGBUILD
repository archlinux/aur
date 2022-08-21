_pkgname='pathvalidate'
pkgname=python-$_pkgname
pkgver=2.5.2
pkgrel=1
pkgdesc='Sanitize/validate strings in filenames/file-paths/etc'
arch=('any')
url='https://github.com/thombashi/pathvalidate'
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/thombashi/pathvalidate/archive/v$pkgver.tar.gz")
sha256sums=('a660ea6dcb0501f9b7fa744347c4974f08988d20ef02ffe422998a3b35672c0e')

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

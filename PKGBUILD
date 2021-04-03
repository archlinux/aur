# Contributors: Caltlgin Stsodaat, vanyasem, Florian Wittmann

_pkgname='pathvalidate'
pkgname=python-$_pkgname
pkgver=2.4.1
pkgrel=1
pkgdesc='Sanitize/validate strings in filenames/file-paths/etc'
arch=('any')
url='https://github.com/thombashi/pathvalidate'
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/thombashi/pathvalidate/archive/v$pkgver.tar.gz")
sha256sums=('f0075659e8e3ad441de6dc9a57cdffec9744a3b07def3db613f0d494f85526cc')

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

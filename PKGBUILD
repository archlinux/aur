# Contributors: Caltlgin Stsodaat, vanyasem, Florian Wittmann

_pkgname='pathvalidate'
pkgname=python-$_pkgname
pkgver=2.3.2
pkgrel=1
pkgdesc='Sanitize/validate strings in filenames/file-paths/etc'
arch=('any')
url='https://github.com/thombashi/pathvalidate'
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/thombashi/pathvalidate/archive/v$pkgver.tar.gz")
sha256sums=('ff9d3f5ae2ab29124545324da51bcc4788a6fe52b9ddc3b74b1707920e2b099a')

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

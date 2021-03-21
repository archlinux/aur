# Contributors: Caltlgin Stsodaat, vanyasem, Florian Wittmann

_pkgname='pathvalidate'
pkgname=python-$_pkgname
pkgver=2.4.0
pkgrel=1
pkgdesc='Sanitize/validate strings in filenames/file-paths/etc'
arch=('any')
url='https://github.com/thombashi/pathvalidate'
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/thombashi/pathvalidate/archive/v$pkgver.tar.gz")
sha256sums=('3a2d20f53a59b899c4e80bc76ee510b8dba5a5934143cfe534d2b29599c14a47')

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

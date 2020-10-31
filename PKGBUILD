# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='cmakew'
pkgver=0.2.0
pkgrel=2
pkgdesc='CMake wrapper CLI tool'
arch=('any')
url='https://github.com/thombashi/cmakew'
_url_pypi='https://pypi.org/project/cmakew'
license=('MIT')
depends=('python-logbook' 'python-six' 'python-subprocrunner' 'python-typepy')
makedepends=('python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('e18a968f7f254a13ae47911538c874e2d9877c0bf7507aa0cdcf1a66d907d376')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dvm644 'README.rst' -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:

# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=cmakew
pkgver=0.2.0
pkgrel=1
pkgdesc='CMake wrapper CLI tool'
arch=('any')
url='https://github.com/thombashi/cmakew'
license=('MIT')
depends=('python' 'python-logbook' 'python-six' 'python-subprocrunner' 'python-typepy')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('e18a968f7f254a13ae47911538c874e2d9877c0bf7507aa0cdcf1a66d907d376')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" 'README.rst'
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" 'LICENSE'
}

# vim: ts=2 sw=2 et:

# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='cleanpy'
pkgver=0.1.0
pkgrel=2
pkgdesc='CLI tool to remove caches and temporary files related to Python'
arch=('any')
url='https://github.com/thombashi/cleanpy'
_url_pypi='https://pypi.org/project/cleanpy'
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('d0a6291bffb2b92f10d3c605a51fba995b4155875206626df060eac30cdb7ff9')

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

# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Michael Greene <mgreene@securityinnovation.com>

_pkgname='solid'
pkgname="python-${_pkgname}"
pkgver=1.0.4
pkgrel=1
pkgdesc='Python interface to the OpenSCAD declarative geometry language'
arch=('any')
url='https://github.com/SolidCode/SolidPython'
_url_pypi='https://pypi.org/project/solidpython'
license=('GPL2')
depends=('python' 'python-euclid3' 'python-prettytable' 'python-pypng' 'python-regex')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}python/${_pkgname}python-${pkgver}.tar.gz"
        "${_pkgname}-${pkgver}-readme::${url}/raw/v${pkgver}/README.rst")
sha256sums=('90fcaf5449f1f89b596740ee77eac9527f5e06d951bb4c6ed579416028ef7e70'
            'bb5c3e17962f1cfa99aefd26b921c38a0862494e167fd4a3be8e88f526b61bba')

build() {
  cd "${_pkgname}python-${pkgver}"
  python setup.py build
}

package() {
  install -Dvm644 "${_pkgname}-${pkgver}-readme" "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
  cd "${_pkgname}python-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

# vim: ts=2 sw=2 et:

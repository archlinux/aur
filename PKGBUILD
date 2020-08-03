# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Florian Wittmann

_pkgname=DataProperty
pkgname=python-${_pkgname,,}
pkgver=0.50.0
pkgrel=1
pkgdesc='Extract properties from data'
arch=('any')
url='https://github.com/thombashi/DataProperty'
license=('MIT')
depends=('python-mbstrdecoder' 'python-typepy')
makedepends=('python-setuptools')
provides=("${_pkgname,,}")
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('847f2d8927d8426a0eb20e48238e2db19133506bcd1e2608e21314004fa80d72')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname,,}" 'README.rst'
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgname,,}" 'LICENSE'
}

# vim: ts=2 sw=2 et:

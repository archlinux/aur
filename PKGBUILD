# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=envinfopy
pkgname=python-${_pkgname}
pkgver=0.0.3
pkgrel=1
pkgdesc='Python Library to get execution environment information'
arch=('any')
url='https://github.com/thombashi/envinfopy'
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
provides=("${_pkgname}")
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('cbee4e6ea91b48b9cfafc5817aa97a44f1d61065a9aa37e5e909838da232ec20')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" 'README.rst'
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgname}" 'LICENSE'
}

# vim: ts=2 sw=2 et:

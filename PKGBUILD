# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=appconfigpy
pkgname=python-${_pkgname}
pkgver=1.0.2
pkgrel=1
pkgdesc='Python library to create/load an application configuration file'
arch=('any')
url='https://github.com/thombashi/appconfigpy'
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
provides=("${_pkgname}")
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('114336a9e01d04c4818fd4512f470f611aabf2ea5925b7ba5a6ca25c70f173d8')

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

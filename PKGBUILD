# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Florian Wittmann

_pkgname='typepy'
pkgname="python-${_pkgname}"
pkgver=1.1.2
pkgrel=1
pkgdesc='Variable run time type checker/validator/converter'
arch=('any')
url='https://github.com/thombashi/typepy'
_url_pypi='https://pypi.org/project/typepy'
license=('MIT')
depends=('python' 'python-mbstrdecoder')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('afec7feeac73d6b01fe6b23314edc17eaf8469f93783d2460c229068ae9dc588')

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

# vim: ts=2 sw=2 et:

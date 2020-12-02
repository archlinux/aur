# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Florian Wittmann

_pkgname='typepy'
pkgname="python-${_pkgname}"
pkgver=1.1.1
pkgrel=2
pkgdesc='Variable run time type checker/validator/converter'
arch=('any')
url='https://github.com/thombashi/typepy'
_url_pypi='https://pypi.org/project/typepy'
license=('MIT')
depends=('python' 'python-mbstrdecoder')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('a0850559dfd135577c6d565c0268fcad1327cab9c4c295015d4d882aa9a24786')

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

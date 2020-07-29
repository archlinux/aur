# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=warcio
pkgname=python-${_pkgname}
pkgver=1.7.3
_pythonhosted_hash='98/42/afdad43bdb48319afc1af2e487a7eab9c4bb6f5630efcf6261d26e75fe9e'
pkgrel=1
pkgdesc='Streaming WARC (and ARC) IO library'
arch=('any')
url='https://github.com/webrecorder/warcio'
license=('APACHE')
depends=('python-six')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/${_pythonhosted_hash}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('23d4b9a7589e5608894ce7106873939fdd0ecc5ed7601458f8b92e32590b0ed2')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 'README.rst' "${pkgdir}/usr/share/doc/${_pkgname}/README.rst"
}

# vim: ts=2 sw=2 et:

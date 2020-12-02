# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: xantares

_pkgname='pytablewriter'
pkgname="python-${_pkgname}"
pkgver=0.58.0
pkgrel=2
pkgdesc='Python library to write a table in various formats'
arch=('any')
url='https://github.com/thombashi/pytablewriter'
_url_pypi='https://pypi.org/project/pytablewriter'
license=('MIT')
depends=('python-dataproperty'
        'python-mbstrdecoder'
        'python-msgfy'
        'python-pathvalidate'
        'python-tabledata'
        'python-tcolorpy'
        'python-typepy')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('d232491e32fc84f28a6217fcd225d2ed82ae59d576d39724c98fdb7c7147b9ec')

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

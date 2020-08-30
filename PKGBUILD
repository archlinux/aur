# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: xantares

_pkgname='pytablewriter'
pkgname="python-${_pkgname}"
pkgver=0.58.0
pkgrel=1
pkgdesc='Python library to write a table in various formats'
arch=('any')
url='https://github.com/thombashi/pytablewriter'
license=('MIT')
depends=('python'
        'python-dataproperty'
        'python-mbstrdecoder'
        'python-msgfy'
        'python-pathvalidate'
        'python-tabledata'
        'python-tcolorpy'
        'python-typepy')
makedepends=('python-setuptools')
provides=("${_pkgname}")
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('d232491e32fc84f28a6217fcd225d2ed82ae59d576d39724c98fdb7c7147b9ec')

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

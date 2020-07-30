# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Florian Wittmann

_pkgname=tabledata
pkgname=python-${_pkgname}
pkgver=1.1.2
pkgrel=1
pkgdesc='Represent tabular data'
arch=('any')
url='https://github.com/thombashi/tabledata'
license=('MIT')
depends=('python-dataproperty' 'python-typepy')
makedepends=('python-setuptools')
provides=("${_pkgname}")
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('db893596ab9066e5c4f002ae0fed70657e3b75cceb52dd1de5a0e145e338d830')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 'README.rst' "${pkgdir}/usr/share/doc/${_pkgname}/README.rst"
  install -Dm644 'LICENSE' "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:

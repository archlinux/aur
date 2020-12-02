# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Florian Wittmann

_pkgname='tabledata'
pkgname="python-${_pkgname}"
pkgver=1.1.3
pkgrel=2
pkgdesc='Represent tabular data'
arch=('any')
url='https://github.com/thombashi/tabledata'
_url_pypi='https://pypi.org/project/tabledata'
license=('MIT')
depends=('python' 'python-dataproperty' 'python-typepy')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('fa4c2db55cbb198ca5e21063ae743f418d3efbba94cd4844d2f759f994df76a2')

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

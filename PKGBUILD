# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Bogdan Szczurek <thebodzio@gmail.com>

_pkgname='transmission-rpc'
pkgname="python-${_pkgname/-/}"
pkgver=3.2.6
pkgrel=1
pkgdesc='Module to communicate with Transmission BT client via JSON-RPC'
arch=('any')
url='https://github.com/Trim21/transmission-rpc'
_url_pypi='https://pypi.org/project/transmission-rpc'
license=('MIT')
depends=('python-requests' 'python-typing_extensions')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('a125826d309d0b0f027252797faae65368d25352673c56f51fe476dc56f69ecc')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:

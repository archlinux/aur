# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Bogdan Szczurek <thebodzio@gmail.com>

_pkgname='transmission-rpc'
pkgname="python-${_pkgname/-/}"
pkgver=3.2.1
pkgrel=2
pkgdesc='Module to communicate with Transmission BT client via JSON-RPC'
arch=('any')
url='https://github.com/Trim21/transmission-rpc'
_url_pypi='https://pypi.org/project/transmission-rpc'
license=('MIT')
depends=('python-requests' 'python-typing_extensions' 'python-yarl')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('04512c856eddcee4f360b61e7e87fe042fd7c73585115095532b880e396cf0d4')

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

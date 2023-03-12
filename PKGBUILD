# Maintainer: Richard Steinmetz <steinmetz.richard@googlemail.com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Bogdan Szczurek <thebodzio@gmail.com>

_name='transmission-rpc'
pkgname="python-${_name/-/}"
pkgver=4.1.3
pkgrel=1
pkgdesc='Module to communicate with Transmission BT client via JSON-RPC'
arch=('any')
url='https://github.com/Trim21/transmission-rpc'
_url_pypi='https://pypi.org/project/transmission-rpc'
license=('MIT')
depends=('python-requests')
makedepends=('python-installer')
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
sha256sums=('207619ac595b639d30197580c6116705e1914416199b45a54df0f96a3c956aad')

package() {
  python -m installer --destdir="$pkgdir" "${_name//-/_}-$pkgver-py3-none-any.whl"
  install -Dvm644 "${pkgdir}"/usr/lib/python*/site-packages/"${_name//-/_}"*.dist-info/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:

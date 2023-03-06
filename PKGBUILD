# Maintainer: Richard Steinmetz <steinmetz.richard@googlemail.com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Bogdan Szczurek <thebodzio@gmail.com>

_name='transmission-rpc'
pkgname="python-${_name/-/}"
pkgver=4.1.2
pkgrel=1
pkgdesc='Module to communicate with Transmission BT client via JSON-RPC'
arch=('any')
url='https://github.com/Trim21/transmission-rpc'
_url_pypi='https://pypi.org/project/transmission-rpc'
license=('MIT')
depends=('python-requests')
makedepends=('python-installer')
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
sha256sums=('1d46119416cf485ca1012bb17f2d80cc8defffd3bf4fbb08a8783ee4ecd099c7')

package() {
  python -m installer --destdir="$pkgdir" "${_name//-/_}-$pkgver-py3-none-any.whl"
  install -Dvm644 "${pkgdir}"/usr/lib/python*/site-packages/"${_name//-/_}"*.dist-info/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:

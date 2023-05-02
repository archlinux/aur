# Maintainer: Richard Steinmetz <steinmetz.richard@googlemail.com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Bogdan Szczurek <thebodzio@gmail.com>

_name='transmission-rpc'
pkgname="python-${_name/-/}"
pkgver=4.2.1
pkgrel=1
pkgdesc='Module to communicate with Transmission BT client via JSON-RPC'
arch=('any')
url='https://github.com/Trim21/transmission-rpc'
_url_pypi='https://pypi.org/project/transmission-rpc'
license=('MIT')
depends=('python-requests' 'python-typing_extensions')
makedepends=('python-installer')
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
sha256sums=('2b2a9d49d73669e1da6a417163e7df0d0dedc1fc7366c1a2e888efe3b718e9c9')

package() {
  python -m installer --destdir="$pkgdir" "${_name//-/_}-$pkgver-py3-none-any.whl"
  install -Dvm644 "${pkgdir}"/usr/lib/python*/site-packages/"${_name//-/_}"*.dist-info/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:

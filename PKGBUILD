# Maintainer: Richard Steinmetz <steinmetz.richard@googlemail.com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Bogdan Szczurek <thebodzio@gmail.com>

_pkgname='transmission-rpc'
_relname='transmission_rpc'
pkgname="python-${_pkgname/-/}"
pkgver=4.0.0
pkgrel=1
pkgdesc='Module to communicate with Transmission BT client via JSON-RPC'
arch=('any')
url='https://github.com/Trim21/transmission-rpc'
_url_pypi='https://pypi.org/project/transmission-rpc'
license=('MIT')
depends=('python-requests')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_relname}-${pkgver}.tar.gz")
sha256sums=('eab08e8ea399aef60ec95cf40686a3cf70ef09cf1df046d17e48fc5e25157d16')

build() {
  cd "${_relname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_relname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:

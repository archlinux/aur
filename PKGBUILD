# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-pypsrp
_pkgname=pypsrp
pkgver=0.8.1
pkgrel=2
pkgdesc="Python PowerShell Remoting Protocol Client Library"
url="https://pypi.org/project/pypsrp/"
arch=('any')
license=('MIT')
depends=('python' 'python-six' 'python-cryptography' 'python-requests'
	 'python-pyspnego' 'python-gssapi')
makedepends=('python-build' 'python-installer' 'python-wheel')
optdepends=('python-krb5: for Kerberos authentication on Linux'
            'python-requests-credssp: for CredSSP authentication')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('f5500acd11dfe742d51b7fbb61321ba721038a300d67763dc52babe709db65e7')

build() {
  cd ${_pkgname}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${_pkgname}-${pkgver}
  python -m installer --destdir="${pkgdir}" dist/*.whl
}

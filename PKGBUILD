# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=adb_shell
pkgname="python-${_pkgname}"
pkgver=0.4.0
pkgrel=1
pkgdesc="A Python implementation of ADB with shell and FileSync functionality."
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('Apache')
depends=('python' 'python-cryptography' 'python-pyasn1' 'python-rsa')
makedepends=('python-setuptools')
optdepends=('python-aiofiles: async API'
            'python-libusb1: To connect to a device via USB')
source=("${pkgname}-${pkgver}.tar.gz::https://pypi.python.org/packages/source/${_pkgname:0:1}/${_pkgname/-/_}/${_pkgname/-/_}-${pkgver}.tar.gz")
sha256sums=('ffcc7042a5102b36c5cbb85b5389e482255c78ecbe0d963e92dcc97b7ee14e68')
b2sums=('1397cb0cf2fdd3a2cf344edf654b58cc9509438c1e28cc28d82fb4e88c16747b21b0ae60a224b16a8c21c1716a4ddc0ec8891b8bb029ac7cb0115f84abaab082')

build() {
  cd "${_pkgname/-/_}-${pkgver}"

  python setup.py build
}

package() {
  cd "${_pkgname/-/_}-${pkgver}"

  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

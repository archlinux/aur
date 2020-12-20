# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=adb_shell
pkgname="python-${_pkgname}"
pkgver=0.3.0
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
sha256sums=('9df0c7dd2e2bac65f388bdcf37296b5c069ec1a4508f442030eb64a34062c95b')
b2sums=('988ce3caa2fea1d98f9bb33d5d9251900f8e9cb32bfae3b0d84ccfc74583f7a24b6c239d74d537a111aa396308b57e7e8e483d4201a10fd72a2aff51bac94e4f')

build() {
  cd "${_pkgname/-/_}-${pkgver}"

  python setup.py build
}

package() {
  cd "${_pkgname/-/_}-${pkgver}"

  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

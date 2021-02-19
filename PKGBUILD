# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=adb_shell
pkgname="python-${_pkgname}"
pkgver=0.3.1
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
sha256sums=('9dd205b94ea8833f1434483a7b7a60139e3d58144e7dd89aa2439bf3658240fb')
b2sums=('299acffdceead5dea69875a2427e3e17fe42945959cbd756c407fba0f1bcfae3bb5c96fa754e6b0d6277e30946dea12996e2b1dff2deb6cdff1eebb3c311c3c8')

build() {
  cd "${_pkgname/-/_}-${pkgver}"

  python setup.py build
}

package() {
  cd "${_pkgname/-/_}-${pkgver}"

  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

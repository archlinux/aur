# Maintainer: Your Name <youremail@domain.com>
_name=elrond-sdk-erdpy
pkgname=python-erdpy
pkgver=1.0.21
pkgrel=1
pkgdesc="Elrond Smart Contracts Tools and Python SDK."
arch=('any')
url="https://docs.elrond.com/sdk-and-tools/erdpy/erdpy/"
license=('GPL3')
depends=('python>=3.6.8'
         'python-toml>=0.10.2'
         'python-bottle'
         'python-requests'
         'python-pynacl'
         'python-pycryptodomex'
         'python-cryptography>=3.2'
         'python-prettytable'
         'python-ledgercomm'
         'python-semver')
makedepends=('python-setuptools')
source=("https://github.com/ElrondNetwork/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('473fcb8548c928aacb0666a075c4e680735ccf589fa4a4bc0750d76afd87c2a9')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install \
    --root="$pkgdir" \
    --optimize=1
}

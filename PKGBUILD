# Maintainer: Anton Semjonov < anton \ät semjonov.de >

pkgname="tinyssh-keyconvert"
pkgdesc="Convert OpenSSH ed25519 / ecdsa-nistp256 secret keys to binary format for TinySSH"

pkgver=0.3.0
pkgrel=2

arch=('any')
url="https://github.com/ansemjo/$pkgname"
license=('GPL-3.0')

depends=()
makedepends=('python-setuptools')

provides=($pkgname)
conflicts=($pkgname)

source=("${url}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('dcadd049383473af446085a5a505be900799d5991876c47a603c0cc38009f0c8')

build() {
  cd "${pkgname}-${pkgver}"
  python ./setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python ./setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}

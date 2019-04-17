# Maintainer: Anton Semjonov < anton \ät semjonov.de >

pkgname="tinyssh-keyconvert"
pkgdesc="Convert OpenSSH ed25519 / ecdsa-nistp256 secret keys to binary format for TinySSH"

pkgver=0.3.1
pkgrel=1

arch=('any')
url="https://github.com/ansemjo/$pkgname"
license=('GPL-3.0')

depends=()
makedepends=('python-setuptools')

provides=($pkgname)
conflicts=($pkgname)

source=("${url}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('f4ce69e8d32ad290ea9a97e765853a443e6a01d821454b1cd04cb9e7c0fdacc6')

build() {
  cd "${pkgname}-${pkgver}"
  python ./setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python ./setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}

# Maintainer: Anton Semjonov < anton \ät semjonov.de >

pkgname="tinyssh-keyconvert"
pkgdesc="Convert OpenSSH ed25519 / ecdsa-nistp256 secret keys to binary format for TinySSH"

pkgver=0.3.0
pkgrel=1

arch=('any')
url="https://github.com/ansemjo/$pkgname"
license=('GPL-3.0')

depends=()
makedepends=('python-setuptools')

provides=($pkgname)
conflicts=($pkgname)

source=("${url}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('cca03f528b7ea3ab23faec1e76633369bbb022818fa3a6252fddd5bfc317ebf9')

build() {
  cd "${pkgname}-${pkgver}"
  python ./setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python ./setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}

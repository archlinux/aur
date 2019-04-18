# Maintainer: Anton Semjonov < anton \ät semjonov.de >

pkgname="tinyssh-keyconvert"
pkgdesc="Convert OpenSSH ed25519 / ecdsa-nistp256 secret keys to binary format for TinySSH"

pkgver=0.3.2
pkgrel=1

arch=('any')
url="https://github.com/ansemjo/$pkgname"
license=('GPL-3.0')

depends=()
makedepends=('python-setuptools')

provides=($pkgname)
conflicts=($pkgname)

source=("${url}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('289a8e679e63ba2e67ac8e5f6c300213604c2f1a557f885d4638e8a0bd200fef')

build() {
  cd "${pkgname}-${pkgver}"
  python ./setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python ./setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}

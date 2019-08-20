# Maintainer: Anton Semjonov < anton \ät semjonov.de >

pkgname="randomart"
pkgdesc="Generate ASCII randomart by hashing input with BLAKE2b and using an adapted drunken bishop alogirthm."

pkgver=0.2.3
pkgrel=1

arch=('any')
url="https://github.com/ansemjo/$pkgname"
license=('MIT')

depends=('python-numpy')
makedepends=('python-setuptools')

provides=($pkgname)
conflicts=($pkgname)

source=("${url}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('8b0cf1c98945e86d631520234ba37340426d5740b1021b9c6a5fa52a8ff3132d')

build() {
  cd "${pkgname}-${pkgver}"
  python ./setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python ./setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

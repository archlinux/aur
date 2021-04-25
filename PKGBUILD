# Maintainer: Joe Bashe <joe@bashe.joe>

_name=twisted
pkgname=python2-twisted-git
pkgver=20.3.0
pkgrel=4
pkgdesc='An open source network framework written entirely in Python.'
arch=('any')
url="https://github.com/twisted/twisted"
license=('GPL2')
depends=('python2')
makedepends=('python2-setuptools')
source=("https://github.com/twisted/twisted/archive/refs/tags/twisted-$pkgver.tar.gz")
sha256sums=('64173c6a561b206bea4193f810ff6f26b549b34e3b581a34eba499669c798427')

build() {
  cd "${_name}-${_name}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${_name}-${_name}-${pkgver}"
  python2 setup.py install --skip-build \
                           --optimize=1 \
                           --prefix=/usr \
                           --root="${pkgdir}"
  install -vDm 644 {NEWS.rst,README.rst} \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}

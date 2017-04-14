# Maintainer: Matthias Kaufmann <2b5e3ee5e375e17631bb6a2210deb78b[__at__]tfwno[__dot__]gf>
pkgname=python2-phply
_pyname=phply
pkgver=1.0.0
pkgrel=1
pkgdesc="Lexer and parser for PHP source implemented using PLY"
url="https://github.com/viraptor/phply"
arch=('any')
license=('BSD')
depends=('python2')
makedepends=('python2-setuptools')
source=(${pkgname}-${pkgver}.tar.gz::https://pypi.python.org/packages/2f/b6/6f3689196078fdf9e48d11289f5d37427956fa755e62ab3284ea07ecb028/${_pyname}-${pkgver}.tar.gz)
md5sums=('5849b0eb9470aab54b0a5d59dbaf63b9')

package() {
  install -D -m644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  cd ${_pyname}-${pkgver}
  python2 setup.py install -O1 --root="$pkgdir/" --prefix=/usr
}

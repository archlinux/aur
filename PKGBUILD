# Maintainer: Daniel Moch <daniel AT danielmoch DOT com>
# Contributor: Greg Fitzgerald <gregf@hugops.pw>

pkgname=python-pocket
_name=${pkgname#python-}
pkgver=0.3.7
pkgrel=1
pkgdesc="api wrapper for getpocket.com"
url="https://github.com/tapanpandita/${_name}"
license=('BSD')
arch=('any')
depends=('python')
makedepends=('python-setuptools')
source=("${_name}-${pkgver}.tar.gz::https://github.com/tapanpandita/pocket/archive/v${pkgver}.tar.gz")
sha512sums=('d6b320c40baabcf4cb6b7c7557a3ecc07b997905336010bc5cb061263b0c6f79d13d9fc51f2c070859f2f1acd85d5508b29eb755538a711b9885b1cee8329d10')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/${_name}-${pkgver}/"
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

# vim: sts=2 sw=2 et ft=PKGBUILD

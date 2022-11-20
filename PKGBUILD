# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Simon Sapin <simon dot sapin at exyr dot org>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=python38-rfc3987
pkgver=1.3.8
pkgrel=8
pkgdesc="Parsing and validation of URIs (RFC 3986) and IRIs (RFC 3987)"
url="https://pypi.python.org/pypi/rfc3987"
license=('GPL')
arch=('any')
depends=('python38')
makedepends=('python38-setuptools')
checkdepends=('python38-pytest-runner')
source=("https://pypi.io/packages/source/r/rfc3987/rfc3987-$pkgver.tar.gz")
sha512sums=('0e81b8dbc8c410f08b1efa7ee1c90174ed6e70bf7622d3748f598d383583b439908e1b5da1e1a1eb22af4f214ae08680a29f00b253f37808034bae8a1808c32c')

build() {
  cd rfc3987-$pkgver
  python3.8 setup.py build
}

package() {
  cd rfc3987-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
}

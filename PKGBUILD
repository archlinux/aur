# Maintainer: Bao Trinh <qubidt at gmail dot com>

_name=pyprojroot
pkgname=python-pyprojroot
pkgver=0.2.0
pkgrel=1
pkgdesc='Find project root paths and return relative project files'
arch=('any')
url=https://github.com/chendaniely/pyprojroot
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('0385909b4d8a9c0a7ff10a1ef68f263fc81833ce5b1e8451a8cc5530ea6ba9c6a96d734f7b7661b3b4f1bfb51dc4d4a7d21b03f8315222a5f82111ef5b2b7c2e')

prepare() {
  mv -v "${_name}-$pkgver" "$pkgname-$pkgver"
}

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --optimize=1 --root="$pkgdir" --skip-build
  install -vDm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

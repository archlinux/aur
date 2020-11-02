# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=jedi-language-server
pkgver=0.21.0
pkgrel=1
pkgdesc='Language server for Jedi'
arch=('any')
url=https://github.com/pappasam/jedi-language-server
license=('MIT')
depends=('python-click' 'python-jedi' 'python-pygls')
makedepends=('python-pip' 'python-poetry')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('bb9d5e5c0aadf69cc441263685c83c12e67b6ed6f546dbd92dbed417123d8a47')
b2sums=('73d3b3fecca4d7df7eb9dafd0bc9618844754c3ba8cbeeb402bab6e342f223ee4de49593dc27e3c1c1bd0a329f49f54e2c17bd5a98750c4f756cba9bca074a3f')

build() {
  cd $pkgname-$pkgver
  poetry build --format wheel
}

package() {
  cd $pkgname-$pkgver
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps dist/*.whl
}

# vim:set ts=2 sw=2 et:

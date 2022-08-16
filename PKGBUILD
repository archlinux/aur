# Maintainer: Moonlit Tune <moonlit underscore tune at protonmail dot com>

pkgname=rnodeconf
pkgver=1.2.2
pkgrel=1
pkgdesc="Configuration utility for RNode hardware"
arch=('any')
depends=('python-cryptography' 'python-pyserial')
makedepends=('python-setuptools')
url="https://github.com/markqvist/rnodeconfigutil"
license=('MIT')
source=(https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/${pkgname//-/_}-$pkgver.tar.gz)
sha256sums=('5d95277a21e33ae314a338d78101cd1802937b4a29b14084aa8b27da1af6e044')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1
}

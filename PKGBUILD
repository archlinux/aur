# Maintainer: Filipe Laíns (FFY00) <filipe.lains@gmail.com>
pkgname=python2-keyrings-alt
_pkgname=keyrings.alt
pkgver=3.1
pkgrel=1
pkgdesc="Alternate keyring backend implementations for use with the keyring package."
arch=('any')
url="https://github.com/jaraco/keyring"
license=('MIT')
depends=('python2-six')
makedepends=('python2-pip')
provides=('python2-keyrings-alt')
conflicts=('python2-keyrings-alt')
source=("https://pypi.io/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('b59c86b67b9027a86e841a49efc41025bcc3b1b0308629617b66b7011e52db5a')

build() {
  cd $_pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
}


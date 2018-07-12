# Maintainer: Filipe Laíns (FFY00) <filipe.lains@gmail.com>
pkgname=python2-secretstorage
_pkgname=${pkgname#python2-}
pkgver=2.3.1
pkgrel=1
pkgdesc="This module provides a way for securely storing passwords and other secrets."
arch=('any')
url="https://github.com/mitya57/secretstorage"
license=('BSD')
depends=('python2-dbus' 'python2-cryptography')
makedepends=('python2-setuptools')
provides=('python2-secretstorage')
conflicts=('python2-secretstorage')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('b69b85110fecb014f2a8f2dd76568a5bb0a80245368eada8babbb8a2a97d4a33')

build() {
  cd "$srcdir"/$_pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd "$srcdir"/$_pkgname-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

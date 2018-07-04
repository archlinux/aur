# Maintainer: Filipe Laíns (FFY00) <filipe.lains@gmail.com>
pkgname=python2-keyring
_pkgname=${pkgname#python2-}
pkgver=13.2.0
pkgrel=2
pkgdesc="Provides an easy way to access the system keyring service from python."
arch=('any')
url="https://github.com/jaraco/keyring"
license=('MIT')
depends=('python2-entrypoints' 'python2-secretstorage')
makedepends=('python2-setuptools-scm')
provides=('python2-keyring')
conflicts=('python2-keyring')
source=("https://pypi.io/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('31bb08c1acd9baeba6cc26586064c8210f5a6f1d5604197a6ce1b7e46b714ce7')

build() {
  cd $_pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1

  mv "$pkgdir"/usr/bin/keyring "$pkgdir"/usr/bin/keyring2
}

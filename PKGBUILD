# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=pytest-datadir
pkgname=python38-$_pkgname
pkgver=1.4.1
pkgrel=1
pkgdesc='pytest plugin for test data directories and files'
arch=('any')
url='https://github.com/gabrielcnr/pytest-datadir'
license=('MIT')
depends=('python38-pytest')
makedepends=('python38-setuptools-scm')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('c3a8740b8798f4682420229ccb816b3681150354ba2a97d5370da0ac09a80e7edb5d45ea26a5b0a4c608f3855cc1debbbc5a5704bd50ab4534fc8a536d5652fe')


build() {
  cd $_pkgname-$pkgver

  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python3.8 setup.py build
}

package() {
  cd $_pkgname-$pkgver

  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python3.8 setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:

# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

_pkgname=flake8-bugbear
pkgname=python-flake8-bugbear
pkgver=17.4.0
pkgrel=1
pkgdesc='A plugin for Flake8 finding likely bugs and design problems in your program'
arch=('any')
url=https://github.com/PyCQA/flake8-bugbear
license=('MIT')
depends=('flake8' 'python-attrs')
makedepends=('python-setuptools')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('0ca65f7fe00baed5db03a915f891b54a18cc5bb1f4821a08767ece9c1871571da2395b180675e82eace1aa6cbb0dec3b1475cffdf78363e49df677f1de9b9ef2')

check() {
  cd $_pkgname-$pkgver
  python setup.py test
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:

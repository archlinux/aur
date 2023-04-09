# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-json-config
pkgver=2.0.1
pkgrel=6
pkgdesc="A convenience utility for working with JSON config files with file syncing"
url="https://github.com/bionikspoon/json_config"
license=('MIT')
arch=('any')
depends=('python-future')
makedepends=('python-setuptools')
checkdepends=('python-mock' 'python-pytest-mock')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bionikspoon/json_config/archive/$pkgver.tar.gz")
sha512sums=('54ad91e3ad8ba73dfb9e5180f7211646d4d24029688874d6db0de5a583515fa6a09b06156d2e4375159327bafaee622e68686a245af25dbebff5348e76a5562b')

build() {
  cd json_config-$pkgver
  python setup.py build
}

check() {
  cd json_config-$pkgver
  pytest
}

package() {
  cd json_config-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

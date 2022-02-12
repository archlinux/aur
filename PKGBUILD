# Maintainer: Morteza NourelahiAlamdari <m@0t1.me>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=sqlfluff
pkgver=0.10.0
pkgrel=1
pkgdesc="A dialect-flexible and configurable SQL linter"
arch=('any')
url="https://www.sqlfluff.com"
license=('MIT')
depends=(
  'python'
  'python-appdirs'
  'python-cached-property'
  'python-chardet'
  'python-click'
  'python-colorama'
  'python-diff-cover'
  'python-jinja'
  'python-oyaml'
  'python-pathspec'
  'python-pytest'
  'python-regex'
  'python-tblib'
  'python-toml'
  'python-tqdm'
  'python-typing_extensions'
)
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sqlfluff/sqlfluff/archive/$pkgver.tar.gz")
sha512sums=('b5f4f39867edb4090e47be5c7f7d9ca7609c49ac0f7250b8a7a98ece352357b5844aa1cedec15658358a6796303e3fe5eacfdebd1eff1cf3c8829454c169a128')
b2sums=('4767d14c5caee1e189a15cb11ca7de6eec1ce8b419e350b7e646c40e299e96b59905c43b840142999a0bbaebd97a85174a1337698ea35227cf3d93691d8bde32')

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install \
    --root="$pkgdir" \
    --optimize=1 \
    --skip-build
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
}

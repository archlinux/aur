# Maintainer: Morteza NourelahiAlamdari <m@0t1.me>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=sqlfluff
pkgver=0.9.4
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
sha512sums=('d229cc3189bfc92219d22ba2e43768338045767961f64ae766424d2bf5f69c13c973e0dfd4dbd1b45933609b61943052c3e3fa781eeea7fd99f023aaf060a164')
b2sums=('fc20768905b4db4e49d4db95e54f61f42d66e199c6af3fb4acdfd35474fce4b0e03e0bb5ccb7c60cea314c15d851c6b5a9b4069737f49d51866bc170a88f16a6')

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

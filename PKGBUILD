# Maintainer: Morteza NourelahiAlamdari <m@0t1.me>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=sqlfluff
pkgver=0.10.1
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
sha256sums=('dc554be63824168b575a7be9b0c250f202f904e5bf3b90027f59e181f6190a53')
b2sums=('d796c13e4556b4e7d81f9cd59eda78153caa124251c8fd50c0dd93b24d58a578ee564125ad8a4ff118e94735e2b608da8f847a48587de60ce97aa24c648e2555')

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

pkgname=python-downwards
pkgver=1.3.0
pkgrel=1
pkgdesc="Read Wikipedia pages as manpages"
arch=('any')
url="https://github.com/noqqe/downwards/"
license=('MIT')
depends=('python-unidecode' 'python-click' 'python-wikipedia' 'python-wikitextparser' 'python-regex' 'python-wcwidth' 'python-mako')
source=("$pkgname-$pkgver.tar.gz::https://github.com/noqqe/downwards/archive/v$pkgver.tar.gz")
sha512sums=('af1af63880a956ea1ae8d8c2e52038f7b2c589f443075bdbc44062d03d56d8dcd36b8082295a25a1a5259178dc30a2e9fd1648d05012a17e439b91109b65d664')

build() {
  cd "$srcdir"/downwards-$pkgver
  python setup.py build
}

package() {
  cd "$srcdir"/downwards-$pkgver
  python setup.py install --skip-build -O1 --root="$pkgdir"
}

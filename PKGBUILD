# Maintainer: user14923929 <user14923929@users.noreply.github.com>
pkgname=highlightforge
pkgver=1.0.1
pkgrel=1
pkgdesc="Convert source code files into syntax-highlighted HTML"
arch=('any')
url="https://github.com/user14923929/highlightforge"
license=('GPL3')
depends=('python' 'python-pygments')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('86bb947a89c80b166f6ce46d5f48f47eedae5a35630ad639f718d37e227909dc')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

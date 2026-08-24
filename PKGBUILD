# Maintainer: Eric Busch <me@etbus.ch>
_name=sourcemap
pkgname=python-sourcemap
pkgver=0.2.1
pkgrel=1
pkgdesc="Parse JavaScript source maps"
arch=('any')
url="https://github.com/mattrobenolt/python-sourcemap"
license=('BSD-2-Clause')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/63/12/0dba762927b6a763fbb33f8a96f5080b0745c7493360c9ead6449c9a9d70/$_name-$pkgver.tar.gz")
sha256sums=('be00a90185e7a16b87bbe62a68ffd5e38bc438ef4700806d9b90e44d8027787c')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer: Ninso112 <ninso112@example.com>
pkgname=netwhy
pkgver=0.1.0
pkgrel=1
pkgdesc="A lightweight Linux CLI tool for network diagnostics"
arch=('any')
url="https://github.com/Ninso112/netwhy"
license=('GPL3')
depends=('python>=3.7')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/heads/main.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/netwhy-main"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/netwhy-main"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

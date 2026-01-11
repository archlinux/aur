# Maintainer: Ninso112
pkgname=fanwhy
pkgver=0.1.0
pkgrel=1
pkgdesc="A lightweight CLI tool to understand why Linux system fans are spinning up"
arch=('any')
url="https://github.com/Ninso112/fanwhy"
license=('GPL3')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Ninso112/fanwhy/archive/refs/heads/main.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname-main"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-main"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

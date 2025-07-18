# Maintainer: zetorik <zetorikk@gmail.com>
pkgname=hyprbop
pkgver=0.1.1
pkgrel=1
pkgdesc="A hacky utility for creating custom popups on hyprland"
arch=('any')
url="https://github.com/zetorik/hyprbop"
license=('GPL3')
depends=('python' 'pyside6')   # runtime dependencies, system packages
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')  # Replace with actual sha256 if needed

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}


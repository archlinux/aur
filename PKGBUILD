# Maintainer: Jason McGillivray < mcgillivray dot jason at gmail dot com>


pkgname=py3status-amdfan
pkgdesc="Py3status module for monitoring fan and temp of amdgpu video cards"
pkgver=0.1.9
pkgrel=1
arch=('any')
license=('MIT')
depends=('python' 'py3status' 'amdfan')
makedepends=('python-installer' 'python-build' 'python' 'py3status' 'python-poetry')
url="https://github.com/mcgillij/py3status-amdfan"
source=("https://github.com/mcgillij/py3status-amdfan/releases/download/$pkgver/py3status_amdfan-$pkgver.tar.gz")
md5sums=('3c51afa5f238f1955d88b10d12d40d22')

build() {
  cd "$srcdir/py3status_amdfan-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/py3status_amdfan-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

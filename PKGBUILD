# Maintainer: Jason McGillivray < mcgillivray dot jason at gmail dot com>


pkgname=py3status-cpu-governor
pkgdesc="Python module for py3status to keep track of your cpu governor state"
pkgver=0.1.4
pkgrel=1
arch=('any')
license=('MIT')
depends=('python' 'py3status' 'python-build' 'python-installer' 'python-poetry')
makedepends=('python-setuptools')
url="https://github.com/mcgillij/py3status-cpu-governor"
source=("https://github.com/mcgillij/py3status-cpu-governor/releases/download/$pkgver/py3status_cpu_governor-$pkgver.tar.gz")
md5sums=('05020e5d4e0baaf5429c0592bd4f5353')

build() {
  cd "$srcdir/py3status_cpu_governor-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/py3status_cpu_governor-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
} 

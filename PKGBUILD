# Maintainer: Jason McGillivray < mcgillivray dot jason at gmail dot com>


pkgname=py3status-http-monitor
pkgdesc="Python module for py3status to monitor http services"
pkgver=0.1.8
pkgrel=1
arch=('any')
license=('MIT')
depends=('python' 'py3status')
makedepends=('python-setuptools' 'python-poetry' 'python-build' 'python-installer')
url="https://github.com/mcgillij/py3status-http-monitor"
#source=("py3status_http_monitor-$pkgver.tar.gz")
source=("https://github.com/mcgillij/py3status-http-monitor/releases/download/$pkgver/py3status_http_monitor-$pkgver.tar.gz")
md5sums=('c423e3df8cf78e379455ffcf20ae1f5c')

build() {
  cd "$srcdir/py3status_http_monitor-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/py3status_http_monitor-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

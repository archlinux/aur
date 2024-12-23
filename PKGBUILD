# Maintainer: Jason McGillivray < mcgillivray dot jason at gmail dot com>


pkgname=py3status-http-monitor
pkgdesc="Python module for py3status to monitor http services"
pkgver=0.1.7
pkgrel=1
arch=('any')
license=('MIT')
depends=('python' 'py3status')
makedepends=('python-setuptools' 'python-poetry' 'python-build' 'python-installer')
url="https://github.com/mcgillij/py3status-http-monitor"
#source=("py3status_http_monitor-$pkgver.tar.gz")
source=("https://github.com/mcgillij/py3status-http-monitor/releases/download/$pkgver/py3status_http_monitor-$pkgver.tar.gz")
md5sums=('a2a2fd23f96f21932dd358446c8f692e')

build() {
  cd "$srcdir/py3status_http_monitor-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/py3status_http_monitor-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

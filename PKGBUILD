# Maintainer: Jason McGillivray < mcgillivray dot jason at gmail dot com>


pkgname=py3status-http-monitor
pkgdesc="Python module for py3status to monitor http services"
pkgver=0.1.5
pkgrel=1
arch=('any')
license=('MIT')
depends=('python' 'py3status' 'python-poetry' 'python-build' 'python-installer')
makedepends=('python-setuptools')
url="https://github.com/mcgillij/py3status-http-monitor"
source=("https://github.com/mcgillij/py3status-http-monitor/releases/download/$pkgver/py3status_http_monitor-$pkgver.tar.gz")
md5sums=('13b5f03931ed4dc2ba11146c34197945')

build() {
  cd "$srcdir/py3status_http_monitor-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/py3status_http_monitor-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

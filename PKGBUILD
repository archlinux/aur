# Maintainer: Jason McGillivray < mcgillivray dot jason at gmail dot com>

pkgname=py3status-github-notifications
poetryname=py3status_github_notifications
pkgdesc="Python module for py3status to keep track of your Github notifications."
pkgver=0.1.11
pkgrel=1
arch=('any')
license=('MIT')
depends=('py3status' 'python' 'python-pygithub')
makedepends=('python-build' 'python-poetry' 'python-installer')
url="https://github.com/mcgillij/py3status-github-notifications"
source=("https://github.com/mcgillij/py3status-github-notifications/releases/download/$pkgver/$poetryname-$pkgver.tar.gz")
md5sums=('12503b8bedb511f120afe59ba8be18b7')

build() {
  cd "$srcdir/$poetryname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$poetryname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

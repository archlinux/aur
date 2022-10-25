# Maintainer: Jason McGillivray < mcgillivray dot jason at gmail dot com>

pkgname=py3status_github_notifications
pkgdesc="Python module for py3status to keep track of your Github notifications."
pkgver=0.1.7
pkgrel=1
arch=('any')
license=('MIT')
makedepends=('python-setuptools')
url="https://github.com/mcgillij/py3status-github-notifications"
source=("https://github.com/mcgillij/py3status-github-notifications/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('1d2e74dc9f83cb38a4ce2e67e5c9c0a8')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
}

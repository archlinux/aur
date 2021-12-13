# Maintainer: Jason McGillivray < mcgillivray dot jason at gmail dot com>


pkgname=py3status-github-notifications
pkgdesc="Python module for py3status to keep track of your Github notifications."
pkgver=0.1.3
pkgrel=1
arch=('any')
license=('MIT')
makedepends=('python-setuptools' "python-dephell")
url="https://github.com/mcgillij/py3status-github-notifications"
source=("https://github.com/mcgillij/py3status-github-notifications/releases/download/0.1.3/py3status-github-notifications-0.1.3.tar.gz")
md5sums=('0348d79b18b5d0177bb545b4f88ad76d')

prepare() {
  cd "$pkgname-$pkgver"
  dephell deps convert --from pyproject.toml --to setup.py
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
}

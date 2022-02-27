# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Rafael Silva <silvagracarafael@gmail.com>
pkgname=vizex
pkgver=2.1.1c
pkgrel=2
pkgdesc="Visualize disk space and disk usage in your UNIX\Linux terminal"
arch=('any')
url="https://github.com/bexxmodd/vizex"
license=('MIT')
depends=('python-click' 'python-colored' 'python-pandas' 'python-psutil'
         'python-magic-ahupp' 'python-tabulate')
makedepends=('python-setuptools')
#checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7081af2197a98c5b9871c62b56c8c16e19f62e022221f1759793f615481ce8f6')

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

#check() {
#  cd "$pkgname-$pkgver"
#  pytest
#}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=python-flake8-todo
_pkgname="${pkgname#python-}"
_name="${_pkgname/-/_}"
pkgver=0.7
pkgrel=3
pkgdesc="flake8 plugin to check for todo notes"
arch=('any')
url="https://github.com/schlamar/flake8-todo"
license=('MIT')
depends=('flake8' 'python-pycodestyle')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('5d2941bf8b7409a1d85a70b984cf48404e50a7249ccbc849e563781614186d2b9e5c4147c9f3e3dee363787a38e32df6f247b331142a2e52eed9d4a38d8eb5ab')

build() {
  cd "$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

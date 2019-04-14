# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>

_name=backports.csv
pkgname=python2-$_name
pkgver=1.0.7
pkgrel=1
pkgdesc='Backport of Python 3 csv module'
arch=('any')
url="https://github.com/ryanhiebert/$_name"
license=('Python')
depends=('python2')
makedepends=('python2-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('fffd46b8b1acb123f55abca18e5954a614fafe9806b3d0ab44aff36b65f01ac4')

build() {
  cd "$_name-$pkgver"

  python2 setup.py build
}

check() {
  cd "$_name-$pkgver"

  python2 setup.py test
}

package() {
  cd "$_name-$pkgver"

  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE.rst "$pkgdir/usr/share/licenses/$pkgname/LICENSE.rst"
}

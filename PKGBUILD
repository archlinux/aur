# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname='python-flask-oldsessions'
pkgver=0.10
pkgrel=5
pkgdesc='Provides a session class that works like the one in Flask before 0.10'
url='https://github.com/mitsuhiko/flask-oldsessions'
arch=('any')
license=('custom:BSD')
depends=('python-flask')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mitsuhiko/flask-oldsessions/archive/$pkgver.tar.gz")
sha256sums=('056e16cbe89187dc5c5fff019aa20c60daec32be2334848f4b813ce51e6701fb')

prepare() {
  cp -r "flask-oldsessions-$pkgver" "python-flask-oldsessions-$pkgver"
}

build() {
  cd "$pkgname-$pkgver"

  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"

  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


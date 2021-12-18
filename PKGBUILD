# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=vdu_controls
pkgver=1.5.7
pkgrel=1
pkgdesc="Visual Display Unit virtual control panel - a GUI front end to ddcutil"
arch=('any')
url="https://github.com/digitaltrails/vdu_controls"
license=('GPL3')
depends=('ddcutil' 'python' 'python-pyqt5')
#makedepends=('python-dephell')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "$pkgname.desktop")
sha256sums=('2a2d782bf52a3dffa873aeeafd9952c3ed61401b0bc0065eb2616b37310fdc5f'
            'e2a7db639d78f066d8214fea9751d5fe4cb14a8835dc2cd5d96d45049abcdab8')

prepare() {
  cd "$pkgname-$pkgver"
#  dephell deps convert --from pyproject.toml --to setup.py

#  sed -i "s/0.0.0/$pkgver/g" setup.py
#  sed -i "s/root/$pkgname/g" setup.py
}

build() {
  cd "$pkgname-$pkgver"
#  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
#  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

#  mv "$pkgdir/usr/bin/$pkgname.py" "$pkgdir/usr/bin/$pkgname"

  install -Dm755 "$pkgname.py" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "docs/_build/man/$pkgname.1" -t "$pkgdir/usr/share/man/man1/"
  install -Dm644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications/"
}

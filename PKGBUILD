# Based on python-ansi 0.1.3 PKGBUILD
# Maintainer: oneup <oneup40 at gmail dot com>

pkgname=python2-ansi
_pkgname=ansi
pkgver=0.1.3
pkgrel=1
pkgdesc="ANSI cursor movement and graphics"
arch=('any')
url="https://github.com/tehmaze/ansi"
license=('MIT')
depends=('python2')
options=(!emptydirs)
source=("https://github.com/tehmaze/$_pkgname/archive/$_pkgname-$pkgver.tar.gz")
md5sums=('4bf5805a69f3584638db101ff4f07ddf')

build() {
  cd "$srcdir/$_pkgname-$_pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

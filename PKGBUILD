# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>

pkgname=python-pyswip
pkgver=0.2.3
pkgrel=4
pkgdesc='Python wrapper for SWI-Prolog'
arch=('any')
url='https://github.com/yuce/pyswip'
license=('MIT')
depends=('python' 'swi-prolog')
makedepends=('python-setuptools' 'git')
source=("git://github.com/yuce/pyswip#commit=72771d9")
sha256sums=('SKIP')

build() {
  cd pyswip

  python setup.py build
}

check() {
  cd pyswip

  python setup.py check
}

package() {
  cd pyswip

  python setup.py install --prefix=/usr --root="$pkgdir"
  install -d "$pkgdir/usr/share/doc/$pkgname"
  cp -R examples "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:

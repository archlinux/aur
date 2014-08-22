# Maintainer: Alexander Rødseth <rodseth@gmail.com>

pkgname=python-pyswip
pkgver=0.2.3
pkgrel=1
pkgdesc='Python wrapper for SWI-Prolog'
arch=('any')
url='https://github.com/swenzel2/pyswip3'
license=('MIT')
depends=('python' 'swi-prolog')
makedepends=('setuptools' 'git')
source=("git://github.com/swenzel2/pyswip3.git#commit=0145fd1f70")
sha256sums=('SKIP')

build() {
  cd pyswip3

  python setup.py build
}

check() {
  cd pyswip3

  python setup.py check
}

package() {
  cd pyswip3

  python setup.py install --prefix=/usr --root="$pkgdir"
  install -d "$pkgdir/usr/share/doc/$pkgname"
  cp -R README examples "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:

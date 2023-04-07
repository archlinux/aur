# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=python-pyswip
pkgver=0.2.10
pkgrel=3
pkgdesc='Python wrapper for SWI-Prolog'
arch=(any)
url='https://github.com/yuce/pyswip'
license=(MIT)
depends=(python swi-prolog)
makedepends=(git python-setuptools)
source=("git+$url#commit=9e9ca3e0059d156397fb020c2bdaef70f59529a6") # tag: v0.2.10
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
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

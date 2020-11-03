# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

_pkgname=pyratemp
pkgname=python-$_pkgname
pkgver=0.3.2
pkgrel=1
pkgdesc="A very simple template-engine for Python"
arch=('any')
url="https://www.simple-is-better.org/template/pyratemp.html"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://www.simple-is-better.org/template/pyratemp-0.3.2.tgz")
sha256sums=('c45ed656ada482a02fe780495f37a695e7671accb04f918f7e7f18abf877bc71')

build(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" -O1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  mv "$pkgdir/usr/bin/tools.py" "$pkgdir/usr/bin/pyratemp_functions.py"
}

# Maintainer: XZS <d dot f dot fischer at web dot de>
pkgname=python-path-and-address
pkgver=1.0.0
pkgrel=1
pkgdesc="Functions for server CLI applications used by humans."
arch=('any')
url="https://github.com/joeyespo/path-and-address"
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'git')
options=(!emptydirs)
source=("$pkgname::git://github.com/joeyespo/path-and-address")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  grep -Po "(?<=version=').*(?=',)" setup.py
}

package() {
  cd "$srcdir/$pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:

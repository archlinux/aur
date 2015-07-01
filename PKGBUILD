# Maintainer: XZS <d dot f dot fischer at web dot de>
pkgver=1.0.0
pkgname=python-path-and-address-git
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
  grep -Po "(?<=version=').*(?=',)" setup.py | tr '\n' '.'
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:

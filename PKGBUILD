# Maintainer: Sam Whited <sam@samwhited.com>

_name="virtualenv-tools3"
pkgname="python-${_name}-git"
pkgver=v3.1.1.r4.ga57fffe
pkgrel=1
pkgdesc="Allows moving a virtualenv to a new location without breaking links."
arch=('any')
url="https://github.com/Yelp/virtualenv-tools"
license=('BSD-like')
depends=('python')
makedepends=('git'
             'python-setuptools')
options=('!emptydirs')
source=("$_name::git+https://github.com/Yelp/virtualenv-tools.git")
sha256sums=('SKIP')
provides=('python-virtualenv-tools3')
conflicts=('python-virtualenv-tools3')

pkgver() {
  cd "$_name"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_name"
  python3 setup.py install --root="$pkgdir" -O1
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -D LICENSE "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:


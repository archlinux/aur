# Maintainer: Heiko Nickerl <dev at heiko-nickerl dot com>
pkgname="python-npyscreen-git"
pkgver=r480.d286599
pkgrel=2
pkgdesc="A python widget library and application framework"
arch=('any')
url="https://github.com/npcole/npyscreen"
license=('BSD')
conflicts=('python-npyscreen')
provides=('python-npyscreen')
makedepends=('git' 'python-setuptools' )
depends=('python' )
source=('git+https://github.com/npcole/npyscreen.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/npyscreen"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
   cd "$srcdir/npyscreen"
   msg "$srcdir/npyscreen/LICENSE"
   install -Dm644 LICENCE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
   python setup.py install --root="$pkgdir/" --optimize=1
}

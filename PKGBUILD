# Maintainer: blacktemplar (blacktemplar@a1.net)
pkgname=electrum-personal-server-git
_gitname=electrum-personal-server
_pkgname=electrum-personal-server
pkgver=eps.v0.2.1.1.r24.g5e26f20
pkgrel=1
pkgdesc="Electrum Personal Server"
arch=('any')
url="https://github.com/chris-belcher/electrum-personal-server"
license=('MIT')
depends=('python' 'python-wheel')
conflicts=('electrum-personal-server')
provides=('electrum-personal-server')
makedepends=('python-setuptools')
source=("${_gitname}::git+https://github.com/chris-belcher/$_gitname.git")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_gitname"
  python setup.py build
}

package(){
  cd "$srcdir/$_gitname"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

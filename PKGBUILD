# Maintainer: Alexandr Skurikhin <askurihin@gmail.com>
# Maintainer: Robert Orzanna <orschiro@gmail.com>
# Maintainer: Quan Guo < guotsuan@gmail.com>

pkgname=cheat-git
pkgver=2.0.9.30.g7eb405d
pkgrel=1
pkgdesc="Cheat allows you to create and view interactive cheatsheets on the command-line"
arch=('any')
license=('GPL3')
url="https://github.com/chrisallenlane/cheat"
depends=('python2' 'python2-docopt')
optdepends=('python-pygments')
makedepends=('git')
source=("$pkgname::git+https://github.com/chrisallenlane/cheat.git")
md5sums=('SKIP')


pkgver() {
  cd $pkgname
  git describe | sed 's/^v//;s/-/./g'
}

package(){
    cd "$pkgname"
    python2 setup.py install --root=$pkgdir
}

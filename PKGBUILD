pkgname='python2-lxc-git'
pkgrel=1
pkgver=20140610
pkgdesc="Python2 bindings for liblxc"
depends=('python2' 'lxc')
url="https://github.com/lxc/python2-lxc"
makedepends=('git' 'python2-distribute')
license=('GPL3')
arch=('x86_64' 'i686')
source=("git+https://github.com/lxc/python2-lxc")
sha1sums=('SKIP')

pkgver() {
  cd "$srcdir/python2-lxc"
  git log -1 --format='%cd' --date=short | tr -d -- '-'
}

package() {
  cd "$srcdir/python2-lxc"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

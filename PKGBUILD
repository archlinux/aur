# Maintainer: M0Rf30

_pkgname=python2-obelisk
pkgname=$_pkgname-git
pkgver=100.2e7a67d
pkgrel=1
pkgdesc="Pure Python Obelisk + Bitcoin client side library"
arch=(any)
url="https://github.com/darkwallet/python-obelisk"
license=('GPL')
depends=('python2' 'python2-pyzmq' 'python2-ecdsa' 'python2-twisted')
makedepends=('git')
source=('obelisk::git+https://github.com/darkwallet/python-obelisk.git')
provides=('python2-obelisk')

package(){
  cd obelisk
  python2 setup.py install --root="$pkgdir"
}

pkgver() {
  cd obelisk
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

md5sums=('SKIP')

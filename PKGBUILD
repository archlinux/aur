# Maintainer: M0Rf30

pkgname=python2-libnacl-git
pkgver=382.dba6d55
pkgrel=1
pkgdesc='A simple ctypes based python binding to libsodium'
arch=('any')
url='http://libnacl.readthedocs.org'
license=('APACHE')
makedepends=(git python-setuptools python2-setuptools libsodium)
conflicts=('python2-libnacl')
replaces=('python2-libnacl')
source=("$pkgname::git+https://github.com/pyca/pynacl.git")

package() {
  cd "$srcdir/$pkgname"
  python2 setup.py install --root="$pkgdir" -O1
}

pkgver() {
  cd $pkgname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

md5sums=('SKIP')

# Maintainer: robertfoster

pkgname=python2-pynacl-git
pkgver=1.4.0.r21.gc3279b1
pkgrel=1
pkgdesc='A simple ctypes based python binding to libsodium'
arch=('any')
url='http://libnacl.readthedocs.org'
license=('APACHE')
makedepends=(git python-setuptools python2-setuptools libsodium)
replaces=('python2-libnacl' 'python2-pynacl')
provides=('python2-pynacl')
source=("$pkgname::git+https://github.com/pyca/pynacl.git")

package() {
  cd "$srcdir/$pkgname"
  python2 setup.py install --root="$pkgdir" -O1
}

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

md5sums=('SKIP')

# Maintainer: Filipe Laíns (FFY00) <filipe.lains@gmail.com>
pkgname=python2-pyipv8-git
_pkgname=py-ipv8
pkgver=r417.b3cf77c
pkgrel=1
pkgdesc="Python implementation of the IPv8 layer"
arch=('any')
url="https://github.com/Tribler/py-ipv8"
license=('Apache')
depends=('python2-cryptography' 'python2-libnacl' 'python2-netifaces' 'python2-networkx' 'python2-twisted' 'python2-pyopenssl')
makedepends=('git')
provides=('python2-pyipv8')
conflicts=('python2-pyipv8')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir"/$_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir"/$_pkgname
  python2 setup.py build
}

package() {
  cd "$srcdir"/$_pkgname
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

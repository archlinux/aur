# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=python2-libemu
_pkgname=pylibemu
pkgver=0.5.8
pkgrel=1
pkgdesc="A Libemu Cython wrapper"
arch=('x86_64')
url="https://github.com/buffer/pylibemu.git"
license=('GPL2')
depends=('python2' 'libemu')
makedepends=('git')
source=("git+$url#commit=d8ee777" "git+https://github.com/buffer/libemu.git#commit=17fd972")
sha256sums=('SKIP' 'SKIP')
makedepends=('python' 'python2' 'python-setuptools')

prepare() {
  cd ${_pkgname}
  git submodule init
  git config submodule.libemu.url "$srcdir"/submudules
  git submodule update
}

package() {
  cd ${_pkgname}
  python2 setup.py install --root="$pkgdir"
}

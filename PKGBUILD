# Modifications to use source from git master
# Maintainer: Jayesh Badwaik <j.badwaik@fz-juelich.de>

pkgname=jube
pkgver=2.5.1
pkgrel=1
pkgdesc="JUBE Benchmarking Environment"
arch=('x86_64')
url="https://www.fz-juelich.de/jsc/jube"
license=('GPL')
makedepends=('python' 'git')
depends=('python')
provides=("jube=$pkgver")
source=("https://github.com/FZJ-JSC/JUBE/archive/refs/tags/REL-$pkgver.tar.gz")
sha256sums=('a8855f0cb3c3d3dab952ea70ce7dbe715f9fdd070a1ff3ecd9b9db147daf3fdd')

prepare() {
  tar -xf REL-$pkgver.tar.gz
}

build() {
  cd JUBE-REL-$pkgver
}

package() {
  cd JUBE-REL-$pkgver
  python setup.py install --prefix=$pkgdir/usr
}

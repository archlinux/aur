# Maintainer: Tim Savannah <kata198@gmail.com>

pkgname=disttask
_realName=disttask
pkgver=2.4.0
pkgrel=1
pkgdesc="Provides the ability to distribute a task across a fixed number of processes, for better utilization of multiprocessing"
arch=('any')
license=('LGPLv2')
url="http://github.com/kata198/disttask"
makedepends=('python-setuptools' 'python')
depends=('python-setuptools' 'python')
source=("https://github.com/kata198/disttask/archive/${pkgver}.tar.gz")
sha512sums=("f969304bcdfaeef64a33e736dee9383a3658306d45a234da1b801e1e4434a7a28bb23726fc7390688c1c96336e1fde8d76f0ad65bd1a508257e56cd4260f42df")

build() {
  cd "$srcdir/${_realName}-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/${_realName}-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  # Remove needless .egg (no library files)
  rm -Rf "${pkgdir}/usr/lib"

}

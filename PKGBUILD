pkgname=python2-rosdep
pkgver=0.11.1
pkgrel=1
pkgdesc="Command-line tool for installing system dependencies on a variety of platforms."
url="http://ros.org/doc/api/rosdep2/html/"
arch=('x86_64' 'i686')
license=('BSD')
depends=('python2' 'python2-catkin_pkg' 'python2-rospkg' 'python2-rosdistro' 'python2-yaml')
optdepends=()
makedepends=('python2-distribute')

source=("https://pypi.python.org/packages/source/r/rosdep/rosdep-${pkgver}.tar.gz")
md5sums=('aa01398a49e05572f5a1d7c1d9a919b8')

build() {
  cd "$srcdir/rosdep-${pkgver}"
  python2 setup.py build
}

package() {
  cd "$srcdir/rosdep-${pkgver}"
  python2 setup.py install -O1 --skip-build --root "${pkgdir}" --prefix=/usr
}


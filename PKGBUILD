pkgname=python2-rosdep
pkgver=0.11.2
pkgrel=2
pkgdesc="Command-line tool for installing system dependencies on a variety of platforms."
url="http://ros.org/doc/api/rosdep2/html/"
arch=('x86_64' 'i686')
license=('BSD')
depends=('python2' 'python2-catkin_pkg' 'python2-rospkg' 'python2-rosdistro' 'python2-yaml')
optdepends=()
makedepends=('python2-distribute' 'python2-setuptools')

source=("https://pypi.python.org/packages/source/r/rosdep/rosdep-${pkgver}.tar.gz")
md5sums=('5ee0f79c4bd8e0335464032ded7afd56')

build() {
  cd "$srcdir/rosdep-${pkgver}"
  python2 setup.py build
}

package() {
  cd "$srcdir/rosdep-${pkgver}"
  python2 setup.py install -O1 --skip-build --root "${pkgdir}" --prefix=/usr
}


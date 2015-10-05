pkgname=python2-rosdep
pkgver=0.11.4
pkgrel=1
pkgdesc="Command-line tool for installing system dependencies on a variety of platforms."
url="http://ros.org/doc/api/rosdep2/html/"
arch=('any')
license=('BSD')
depends=('python2' 'python2-catkin-pkg' 'python2-rospkg' 'python2-rosdistro' 'python2-yaml')
optdepends=()
makedepends=('python2-distribute' 'python2-setuptools')

source=("https://pypi.python.org/packages/source/r/rosdep/rosdep-${pkgver}.tar.gz")
sha256sums=('e4f31d4d0245798b1bc5fb16a111456ea308d9fb7b1f2d202d0fea8475c88bb8')

build() {
  cd "$srcdir/rosdep-${pkgver}"
  python2 setup.py build
}

package() {
  cd "$srcdir/rosdep-${pkgver}"
  python2 setup.py install -O1 --skip-build --root "${pkgdir}" --prefix=/usr
}


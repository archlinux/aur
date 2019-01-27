# Maintainer: willemw <willemw12@gmail.com>

_pkgname=castero
pkgname=$_pkgname-git
pkgver=0.4.0.r0.g8a1ac98
pkgrel=1
pkgdesc="Podcast client for the command line"
arch=('any')
url="https://xgi.github.io/castero"
license=('MIT')
depends=('python-cjkwrap' 'python-pympv' 'python-requests' 'python-vlc')
#checkdepends=('python-codecov' 'python-coverage' 'python-pytest')
makedepends=('git')
provides=($_pkgname)
conflicts=($_pkgname)
source=($pkgname::git+https://github.com/xgi/castero.git)
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

#build() {
#  cd $pkgname
#  python setup.py build
#}

#check() {
#  cd $pkgname
#  python -m pytest tests
#}

package() {
  cd $pkgname
  python setup.py install --root="$pkgdir/" --optimize=1
}


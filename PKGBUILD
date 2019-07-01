# Maintainer: willemw <willemw12@gmail.com>

_pkgname=castero
pkgname=$_pkgname-git
pkgver=0.5.3.r11.gd06eed7
pkgrel=1
pkgdesc="Podcast client for the command line"
arch=('any')
url="https://github.com/xgi/castero"
license=('MIT')
depends=('python-beautifulsoup4' 'python-cjkwrap' 'python-mpv' 'python-requests' 'python-vlc')
#checkdepends=('python-codacy-coverage' 'python-coverage' 'python-pytest')
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


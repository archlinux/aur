# Maintainer: willemw <willemw12@gmail.com>

pkgname=castero-git
pkgver=0.8.0.r45.g29f42b1
pkgrel=1
pkgdesc="Podcast client for the command line"
arch=('any')
url="https://github.com/xgi/castero"
license=('MIT')
depends=('python-beautifulsoup4' 'python-cjkwrap' 'python-grequests' 'python-lxml' 'python-mpv' 'python-requests' 'python-vlc')
#checkdepends=('python-codacy-coverage' 'python-coverage' 'python-pytest')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
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


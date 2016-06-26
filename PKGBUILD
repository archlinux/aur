# Maintainer: Sonic-Y3k <sonic.y3k@googlemail.com>
# Contributor: crabmanX
pkgname='m4baker-git'
pkgver=0.1.92.r23.gf282d42
pkgrel=2
pkgdesc="Bake full-featured m4b-audiobooks"
arch=('any')
url="https://github.com/crabmanX/m4baker"
license=('GPL2')
depends=('python2' 'qt4>=4.5' 'python2-pyqt4>=4.6' 'faac>=1.26' 'sox>=14.3' 'libmp4v2>=1.9')
replaces=('m4baker')
conflicts=('m4baker')
source=('m4baker::git+https://github.com/Sonic-Y3k/m4baker.git')
sha256sums=("SKIP")

pkgver() {
  cd "${srcdir}/m4baker"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/m4baker"
  python2 setup.py build
}

package(){
  cd "${srcdir}/m4baker"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# Maintainer: Edison Ibañez <edison@openmailbox.org> 

pkgname=pilas-engine-git
my_pkgname=pilas
pkgver=20150909
pkgrel=1
pkgdesc="Un motor para hacer videojuegos de manera sencilla en Python.  An engine to make games in an easy way with Python."
arch=('any')
depends=('python2' 'python2-setuptools' 'python2-pyqt4' 'box2d' 'python2-pybox2d' 'python2-pygame')
makedepends=('mercurial')
conflicts=('pilas-hg' 'pilas-git' 'pilas-engine')
license=('LGPL')
url="http://www.pilas-engine.com.ar"

source=("$my_pkgname"::"git+https://github.com/hugoruscitti/pilas.git")

package() {
    msg "Starting build..."
    cd $srcdir/$my_pkgname
    python2 setup.py build
    python2 setup.py install --prefix=/usr --root "${pkgdir}" || return 1
}
md5sums=('SKIP')

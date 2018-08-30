# Maintainer: Michal Ulianko <michal (dot) ulianko (at) gmail (dot) com>

pkgname=python-pivy-git
pkgver=0.6.4.r4.gd828a33
pkgrel=1
pkgdesc="Coin binding for Python"
arch=('x86_64')
url="https://github.com/FreeCAD/pivy"
license=('other')
depends=('python' 'coin-hg' 'python-pyside2')
makedepends=('git' 'cmake' 'swig')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('pivy::git+https://github.com/FreeCAD/pivy.git')
noextract=()
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/pivy"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$srcdir/pivy"
    python setup.py install --root="$pkgdir/" --optimize=1
}

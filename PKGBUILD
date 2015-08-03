# Maintainer: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>

_pkgname='xdot.py'
pkgname=xdot-git
pkgver=2fb8a8a
pkgrel=1
pkgdesc="Interactive viewer for Graphviz dot files (git version)"
arch=('any')
url="https://github.com/jrfonseca/xdot.py"
license=('LGPL')
makedepends=('git')
depends=('graphviz' 'pygtk' 'python2-distribute' 'python2-gobject')

provides=('xdot')
conflicts=('xdot')

source=('git://github.com/jrfonseca/xdot.py.git')
md5sums=('SKIP')

pkgver() {
    cd $_pkgname
    git describe --always | sed -e 's|-|.|g'
}

package() {
    cd $_pkgname
    python2 setup.py install --root=$pkgdir --optimize=1
}

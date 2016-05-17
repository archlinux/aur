# Maintainer: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>

_pkgname='xdot.py'
pkgname=xdot-git
pkgver=0.7.r10.g322b889
pkgrel=1
pkgdesc="Interactive viewer for Graphviz dot files (git version)"
arch=('any')
url="https://github.com/jrfonseca/xdot.py"
license=('LGPL2.1')
makedepends=('git')
depends=('graphviz' 'python' 'gtk3' 'python-gobject' 'python-cairo' 'python-setuptools')

provides=('xdot')
conflicts=('xdot')

source=('git://github.com/jrfonseca/xdot.py.git')
md5sums=('SKIP')

pkgver() {
    cd $_pkgname
    git describe --tags | sed -e 's|-|.r|' | sed -e 's|-|.|'
}

package() {
    cd $_pkgname
    python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}

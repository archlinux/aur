# Contributor: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>

_pkgname='xdot.py'
pkgname=xdot-git
pkgver=1.0.r1.g9ce8cca
pkgrel=1
pkgdesc="Interactive viewer for Graphviz dot files (git version)"
arch=('any')
url="https://github.com/jrfonseca/xdot.py"
license=('LGPL2.1')
makedepends=('git')
depends=('graphviz' 'python' 'gtk3' 'python-gobject' 'python-cairo' 'python-setuptools' 'python-graphviz')

provides=('xdot')
conflicts=('xdot')

source=('git+https://github.com/jrfonseca/xdot.py.git')
md5sums=('SKIP')

pkgver() {
    cd $_pkgname
    git describe --tags | sed -e 's|-|.r|' | sed -e 's|-|.|'
}

package() {
    cd $_pkgname
    python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}

# Contributor: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>

_pkgname='xdot.py'
pkgname=xdot-git
pkgver=1.2.r7.g6f0a5cc
pkgrel=1
pkgdesc="Interactive viewer for Graphviz dot files (git version)"
arch=('any')
url="https://github.com/jrfonseca/xdot.py"
license=('LGPL2.1')
makedepends=('git')
depends=('graphviz' 'python' 'gtk3' 'python-gobject' 'python-cairo' 'python-setuptools' 'python-graphviz' 'python-numpy')

provides=('xdot')
conflicts=('xdot')

source=('git+https://github.com/jrfonseca/xdot.py.git')
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd $_pkgname
    python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}

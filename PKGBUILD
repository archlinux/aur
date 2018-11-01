# Maintainer: Gabriele Musco <emaildigabry@gmail.com>
# Upstream URL: https://gitlab.com/gabmus/python-gmgtk

_pkgbase='python-gmgtk'
pkgbase='python-gmgtk'
pkgname='python-gmgtk-git'
pkgver=1.0.r0.g22f826c
pkgrel=1
pkgdesc="Boilerplate code for Gtk+ 3 apps with python 3.x"
arch=('any')
url='https://gitlab.com/gabmus/python-gmgtk'
depends=('python' 'gtk3>=3.24')
makedepends=('python-setuptools')
provides=('python-gmgtk')
conflicts=('python-gmgtk')
license=('GPL3')
source=("${_pkgbase}::git+https://gitlab.com/gabmus/python-gmgtk")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgbase"
  git describe --long --tags --always | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "${srcdir}/${_pkgbase}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

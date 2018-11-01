# Maintainer: Gabriele Musco <emaildigabry@gmail.com>
# Upstream URL: https://gitlab.com/gabmus/python-gmconfig

_pkgbase='python-gmconfig'
pkgbase='python-gmconfig'
pkgname='python-gmconfig-git'
pkgver=1.0.1.r0.g6a939ce
pkgrel=1
pkgdesc="Simple JSON based configuration file manager for python 3.x"
arch=('any')
url='https://gitlab.com/gabmus/python-gmconfig'
depends=('python')
makedepends=('python-setuptools')
provides=('python-gmconfig')
conflicts=('python-gmconfig')
license=('GPL3')
source=("${_pkgbase}::git+https://gitlab.com/gabmus/python-gmconfig")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgbase"
  git describe --long --tags --always | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "${srcdir}/${_pkgbase}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

# Maintainer : vsilv <vsilv@posteo.eu>
pkgname=python-pydstool-git
pkgver=v0.90.2
pkgrel=1
pkgdesc="PyDSTool is a sophisticated & integrated simulation and analysis environment for dynamical systems models of physical systems (ODEs, DAEs, maps, and hybrid systems)."
arch=('i686' 'x86_64')
url="https://github.com/robclewley/pydstool"
license=('BSD')
depends=('python>=3.3' 'python-numpy' 'python-scipy')
makedepends=('git')
provides=('python-pydstool')
source=('pydstool::git+https://github.com/robclewley/pydstool.git')

md5sums=('SKIP')
_gitname='pydstool'

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}
build() {
  cd "${srcdir}/${_gitname}"
  python setup.py build

}

package() {
  cd "${srcdir}/${_gitname}"
  python setup.py install --prefix=/usr --root=${pkgdir} -O1 --skip-build
  
}


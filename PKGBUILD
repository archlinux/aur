# Maintainer: Nikola Milinković <nikmil@gmail.com>

_gitroot="https://github.com/Diaoul/enzyme"
_gitname="enzyme"
pkgbase=python2-enzyme-git
pkgname=('python2-enzyme-git' 'python-enzyme-git')
pkgver=0.4.2.r21.9572bea
pkgrel=1
epoch=1
pkgdesc="Python module to parse metadata in video files."
arch=(any)
url="https://github.com/Diaoul/enzyme"
license=('Apache')
makedepends=('git' 'python2-setuptools' 'python-setuptools')
source=("${_gitname}::git+${_gitroot}.git")
md5sums=('SKIP')

pkgver() {
  cd ${_gitname}
  printf "0.4.2.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package_python2-enzyme-git() {
  provides=(python2-enzyme=${pkgver})
  conflicts=(python2-enzyme)
  cd ${srcdir}/${_gitname}
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}

package_python-enzyme-git() {
  provides=(python-enzyme=${pkgver})
  conflicts=(python-enzyme)
  cd ${srcdir}/${_gitname}
  python3 setup.py install --root="${pkgdir}/" --optimize=1
}

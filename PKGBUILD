# Maintainer: rains31@gmail.com

pkgname=python-xlib-git
_gitname=python3-xlib
pkgver=0.15rc1
pkgrel=1
pkgdesc='Python 3 port of Xlib. the same as python-xlib, but python-xlib can not install correctly if you are using python2 as the default python.'
arch=(any)
url="https://github.com/LiuLang/python3-xlib"
license=('GPL2')
depends=('python')
provides=('python-xlib')
conflicts=('python-xlib')
source=("git+https://github.com/LiuLang/python3-xlib.git")
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --tags | sed 's/^v//;s/-/./g'
}
    
build() {
  cd "${srcdir}/${_gitname}"
  python3 setup.py build
  # make info
}

package() {
  cd "${srcdir}/${_gitname}"
  python3 setup.py install --root "$pkgdir"
}

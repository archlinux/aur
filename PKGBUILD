# Maintainer: Konstantinos Foutzopoulos <mail@konfou.xyz>

_pkgname=calysto_scheme
pkgname=jupyter-${_pkgname}-git
pkgver=r61.c7235ee
pkgrel=1
pkgdesc="A Scheme kernel for Jupyter that can use Python libraries (GIT version)"
arch=('any')
url="https://github.com/Calysto/calysto_scheme"
license=('BSD')
depends=('jupyter-metakernel')
makedepends=('python-setuptools')
source=("git+https://github.com/Calysto/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}"
  python setup.py build
}

package(){
  cd "${_pkgname}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim:ts=2:sw=2:et:

# Maintainer: Konstantinos Foutzopoulos <mail@konfou.xyz>

_pkgname=calysto_processing
pkgname=jupyter-${_pkgname}-git
pkgver=r22.3594bf7
pkgrel=1
pkgdesc="Calysto Processing kernel for Jupyter (GIT version)"
arch=('any')
url="https://github.com/Calysto/calysto_processing"
license=('BSD')
depends=('jupyter-metakernel' 'python-html2text' 'processing')
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

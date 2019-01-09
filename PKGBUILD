# Maintainer: Ruikai Liu <lrk700 at gmail dot com>
# Contributor: Alexander Kobel <a-kobel at a-kobel dot de>

_pkgname=PyMuPDF
pkgname=('python2-pymupdf' 'python-pymupdf')
pkgver=1.14.5
pkgrel=1
pkgdesc='Python bindings for MuPDF'
arch=('x86_64')
url='https://github.com/rk700/PyMuPDF'
license=('AGPL3')
depends=('python2>=2.7' 'python2<2.8')
makedepends=('python2-pip' 'python-pip')

source=("${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-cp27-cp27mu-manylinux1_x86_64.whl"
"${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-cp37-cp37m-manylinux1_x86_64.whl")
noextract=("${_pkgname}-${pkgver}-cp27-cp27mu-manylinux1_x86_64.whl"
           "${_pkgname}-${pkgver}-cp37-cp37m-manylinux1_x86_64.whl")
sha256sums=('539b623374e7157734b7c8f7ce90dd0bbcb0d5040473e6844f7b2d9ddb0fc6f2'
'4917623d7153ca82875b0f5b75957eaf38fa9ff2846312c63d936c9f57dec671')

package_python2-pymupdf() {
  cd "${srcdir}"
  pip2 install --root="${pkgdir}" "${_pkgname}-${pkgver}-cp27-cp27mu-manylinux1_x86_64.whl"
}

package_python-pymupdf() {
  depends=('python>=3.7' 'python<3.8')
  cd "${srcdir}"
  pip install --root="${pkgdir}" "${_pkgname}-${pkgver}-cp37-cp37m-manylinux1_x86_64.whl"
}

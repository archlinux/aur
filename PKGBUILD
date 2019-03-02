# Maintainer: Ruikai Liu <lrk700 at gmail dot com>
# Contributor: Alexander Kobel <a-kobel at a-kobel dot de>

_pkgname=PyMuPDF
pkgname=('python2-pymupdf' 'python-pymupdf')
pkgver=1.14.8
pkgrel=1
pkgdesc='Python bindings for MuPDF'
arch=('x86_64')
url='https://github.com/pymupdf/PyMuPDF'
license=('AGPL3')
depends=('python2>=2.7' 'python2<2.8')
makedepends=('python2-pip' 'python-pip')

source=("${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-cp27-cp27mu-manylinux1_x86_64.whl"
"${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-cp37-cp37m-manylinux1_x86_64.whl")
noextract=("${_pkgname}-${pkgver}-cp27-cp27mu-manylinux1_x86_64.whl"
           "${_pkgname}-${pkgver}-cp37-cp37m-manylinux1_x86_64.whl")
sha256sums=('193353a7451c2a453732234bc1cc1e658ee6fd0cf303a85353a0e8381bbdd3a6'
'a49798b58cce00e09b8a4431a5f64a400b11a0959f29507187c471208ce040a5')

package_python2-pymupdf() {
  cd "${srcdir}"
  pip2 install --root="${pkgdir}" "${_pkgname}-${pkgver}-cp27-cp27mu-manylinux1_x86_64.whl"
}

package_python-pymupdf() {
  depends=('python>=3.7' 'python<3.8')
  cd "${srcdir}"
  pip install --root="${pkgdir}" "${_pkgname}-${pkgver}-cp37-cp37m-manylinux1_x86_64.whl"
}

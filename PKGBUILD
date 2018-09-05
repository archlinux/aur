# Maintainer: Ruikai Liu <lrk700 at gmail dot com>
# Contributor: Alexander Kobel <a-kobel at a-kobel dot de>

_pkgname=PyMuPDF
pkgname=('python2-pymupdf' 'python-pymupdf')
pkgver=1.13.19
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
sha256sums=('6ce0975bc644c3153fd4d58e33085608106f80a3776ecc09cf3f72b716ddf89f'
'c18f8ee416bf261ef54bfafb8a4e76f140ad65a34e9b27601a610118a6bf96e3')

package_python2-pymupdf() {
  cd "${srcdir}"
  pip2 install --root="${pkgdir}" "${_pkgname}-${pkgver}-cp27-cp27mu-manylinux1_x86_64.whl"
}

package_python-pymupdf() {
  depends=('python>=3.7' 'python<3.8')
  cd "${srcdir}"
  pip install --root="${pkgdir}" "${_pkgname}-${pkgver}-cp37-cp37m-manylinux1_x86_64.whl"
}

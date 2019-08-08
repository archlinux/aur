# Maintainer: Andrew Sun <adsun701 at gmail dot com>

_name=simplekv
pkgname=python-simplekv
pkgver=0.13.0
pkgrel=1
pkgdesc="A simple key-value store for binary data"
arch=('any')
url="https://github.com/mbr/simplekv"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('74cafda6d733deda87b5c6273155a971c8b94c02ffac7d0d241930690c57ee2ef995a232a27c8cdc54871fc1e257e33467c732818915d7ab6cf76ca63200ad3b')

build(){
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 "${srcdir}/${_name}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# Maintainer: Andrew Sun <adsun701 at gmail dot com>

_name=simplekv
pkgname=python-simplekv
pkgver=0.14.0
pkgrel=1
pkgdesc="A simple key-value store for binary data"
arch=('any')
url="https://github.com/mbr/simplekv"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("${_name}-${pkgver}.tar.gz"::"https://github.com/mbr/${_name}/archive/${pkgver}.tar.gz")
sha512sums=('e82e9172ec0d4cd77ea9aa93e999aa57785d0c5d2ec3e221d97b63c63e04dd90ace08bf1951a6a5ada43247af24248e5c72549fa84aa9261f72b236e15944d8f')

build(){
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 "${srcdir}/${_name}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# Maintainer: Andrew Sun <adsun701 at gmail dot com>

_name=simplekv
pkgname=python-simplekv
pkgver=0.14.1
pkgrel=1
pkgdesc="A simple key-value store for binary data"
arch=('any')
url="https://github.com/mbr/simplekv"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("${_name}-${pkgver}.tar.gz"::"https://github.com/mbr/${_name}/archive/${pkgver}.tar.gz")
sha512sums=('accc8dd77fc267f8236fca807a6fe0e3772736929a7198139a6d3bc0311ce7ffb17f8a64b7c64c6641e9fc9c6c145bc756783fec59c39d366e905159c93c19fa')

build(){
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 "${srcdir}/${_name}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

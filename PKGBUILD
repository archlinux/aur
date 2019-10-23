# Maintainer: Andrew Sun <adsun701 at gmail dot com>

_name=simplekv
pkgname=python-simplekv
pkgver=0.13.1
pkgrel=1
pkgdesc="A simple key-value store for binary data"
arch=('any')
url="https://github.com/mbr/simplekv"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("${_name}-${pkgver}.tar.gz"::"https://github.com/mbr/${_name}/archive/${pkgver}.tar.gz")
sha512sums=('8911f4d103070f66d1aa6ee2cd8570372e9ae7878a16b3673808098ad4fe1cea410cb8331d805cf98fde383af1609aca9363a1724f3f73e38c503f4b1215c629')

build(){
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 "${srcdir}/${_name}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# Maintainer: Joe Bashe <joe@bashe.joe>

_name=incremental
pkgname=python2-incremental-git
pkgver=21.3.0
pkgrel=1
pkgdesc='A small library that versions your Python projects.'
arch=('any')
url='https://github.com/twisted/incremental'
license=('GPL2')
depends=('python2')
makedepends=('python2-setuptools')
source=("https://github.com/twisted/incremental/archive/refs/tags/incremental-$pkgver.tar.gz")
sha256sums=('57b6a0785f265ffe59a454276efac1062943bb5b7bff7b5505bf054a563c22c4')

build() {
  cd "${_name}-${_name}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${_name}-${_name}-${pkgver}"
  python2 setup.py install --skip-build \
                           --optimize=1 \
                           --prefix=/usr \
                           --root="${pkgdir}"
  install -vDm 644 {NEWS.rst,README.rst} \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}

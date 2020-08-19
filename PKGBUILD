# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname='python-asv'
_pkgname='asv'
pkgver=0.4.2
pkgrel=1
pkgdesc="A simple benchmarking tool with web-based reporting."
arch=('x86_64')
url="https://asv.readthedocs.io"
license=('BSD-3')
depends=()
checkdepends=('python-pytest' 'python-virtualenv')
optdepends=()
makedepends=('cython')
source=("$pkgname-$pkgver.tar.gz::https://github.com/airspeed-velocity/asv/archive/v$pkgver.tar.gz")
sha256sums=('af5c83d4a5048be8147668564eb6da75a8e8284d5d0372cf956f880acfc09670')


build(){
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build_ext --inplace
}

package(){
  cd "${srcdir}/${_pkgname}-${pkgver}"
  install -D -m644 LICENSE.rst "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.rst"
  python setup.py install --root="${pkgdir}"
}

check(){
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py test
}
# vim:ts=2:sw=2:et:

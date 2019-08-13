# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname='python-asv'
_pkgname='asv'
pkgver=0.4.1
pkgrel=1
pkgdesc="A simple benchmarking tool with web-based reporting."
arch=('any')
url="https://asv.readthedocs.io"
license=('BSD-3')
depends=()
checkdepends=('python-pytest' 'python-virtualenv')
optdepends=()
makedepends=('cython')
source=("https://github.com/airspeed-velocity/asv/archive/v$pkgver.tar.gz")
sha256sums=('68fe2035e1bc983c444a5b9e01919afaf2c9d92851791ea37e58a3bc611c92e5')


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

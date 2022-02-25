# Contributor: Antonio Rojas <arojas@archlinux.org>
_base=PySingular
pkgbase=${_base,,}
pkgname=python-${_base,,}
pkgver=0.9.7
pkgrel=1
pkgdesc="A Python interface to Singular"
arch=(i686 x86_64)
url="https://github.com/sebasguts/${_base}"
license=(GPL2)
depends=(python singular)
makedepends=(python-setuptools)
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('0c021427f1cbff4136fba1d3280701bd00af003362dd061acf7a607930b483ba36b2fbb085949af5e3219ad3710a5933a470165503e5e0733bcb169bc5536668')

build() {
  cd ${_base}-${pkgver}
  python setup.py build
}

package() {
  cd ${_base}-${pkgver}
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

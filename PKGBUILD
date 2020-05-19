# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=python-aktools
pkgver=0.0.14
pkgrel=1
pkgdesc="An elegant and simple HTTP server library for AkShare, built for aksharers"
arch=('any')
url='https://aktools.readthedocs.io'
license=('MIT')
provides=('aktools')
depends=('python-akshare'
         'python-fastapi')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jindaxiang/aktools/archive/v${pkgver}.tar.gz")
sha256sums=('64e628a74a267ed3cbd01cb7b2fc788234aee2ec132fb4d9af6112a22dae06f1')

build() {
  cd ${srcdir}/aktools-${pkgver}
  python setup.py build
}

package() {
  cd ${srcdir}/aktools-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
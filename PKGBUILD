## Maintainer: Pieter Lenaerts <pieter.aj.lenaerts@gmail.com>
##
## Contributor: EndlessEden
## Contributor: xantares 

pkgname=python-sox
pkgver=1.5.0
pkgrel=1
pkgdesc="Python wrapper around SoX"
url="https://github.com/rabitt/pysox"
arch=(any)
license=('MIT')
makedepends=('python-setuptools')
depends=('python' 'sox')
source=("https://github.com/marl/pysox/releases/download/v${pkgver}/sox-${pkgver}.tar.gz")
sha512sums=('32e25b411c62a2c7d1b2e9351052707938c7f8ae39c7df80fc01a6509ee4fb908f4abeba8a4e6040b36cd04a9099b1f5d160b7f2b1854a9362cf13b2f0c1a284')

prepare() {
  cd "${srcdir}"/sox-$pkgver
}

build() {
  cd "${srcdir}"/sox-$pkgver
  python setup.py build
}

package_python-sox() {
  cd "${srcdir}/sox-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1
}

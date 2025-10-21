# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Lam Duong <lamduongt94@gmail.com>

pkgname=python-fastcore
_pkgname=fastcore
pkgver=1.8.13
pkgrel=1
pkgdesc='Python supercharged for the fastai library'
arch=('any')
url='https://github.com/fastai/fastcore'
license=('Apache')
depends=(
  python
  python-matplotlib
  python-numpy
  python-pillow
)
makedepends=(
  python-setuptools
)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/fastai/fastcore/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('e0436f2055ddb52bae048aa81271deef03607e26806a6a5e1bb1d230890bb6d08956090130a65c813970d8d97a15085b4daa93dbd3d3679a32f2c586ca68ffa3')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

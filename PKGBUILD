# Mainteiner: Alexey Nurmukhametov [nurmukhametov] <echo YWxleEBudXJtdWtoYW1ldG92LnJ1Cg== | base64 -d>

pkgname=triton
_pkgname=Triton
pkgver=0.8
pkgrel=1
pkgdesc='Dynamic binary analysis framework'
url='https://triton.quarkslab.com/'
arch=('x86_64')
license=('Apache')
depends=('boost-libs' 'capstone' 'z3' 'python')
makedepends=('boost')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/JonathanSalwan/${_pkgname}/archive/v${pkgver}.tar.gz)
sha512sums=('d8190308ff98dcd54925db5d5900d3f5bf630e3a0bb9f97b0f410966bc0f64fd707598f6e20cdb0bf78213357a90f03e631cfa2840b07bcf56b414f3d01b20e6')

build() {
  cd ${_pkgname}-${pkgver}
  cmake ./ -DPYTHON36=on -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd ${_pkgname}-${pkgver}
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:

# Mainteiner: Alexey Nurmukhametov [nurmukhametov] <echo YWxleEBudXJtdWtoYW1ldG92LnJ1Cg== | base64 -d>

pkgname=triton
_pkgname=Triton
pkgver=0.7
pkgrel=1
pkgdesc='Dynamic binary analysis framework'
url='https://triton.quarkslab.com/'
arch=('x86_64')
license=('Apache')
depends=('boost-libs' 'capstone' 'z3' 'python')
makedepends=('boost')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/JonathanSalwan/${_pkgname}/archive/v${pkgver}.tar.gz)
sha512sums=('dce29a348c95eb14f87a4e861ff43e37b5ef69b5b61fe79bb226f4bcd4804de0d3966371febd4e8a2ba36e3756c5cb78bb8de31cfa080706a332faa8a87e30a9')

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

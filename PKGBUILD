# Mainteiner: Alexey Nurmukhametov [nurmukhametov] <echo YWxleEBudXJtdWtoYW1ldG92LnJ1Cg== | base64 -d>

pkgname=triton
_pkgname=Triton
pkgver=0.8.1
pkgrel=1
pkgdesc='Dynamic binary analysis framework'
url='https://triton.quarkslab.com/'
arch=('x86_64')
license=('Apache')
depends=('boost-libs' 'capstone' 'z3' 'python')
makedepends=('boost' 'cmake')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/JonathanSalwan/${_pkgname}/archive/v${pkgver}.tar.gz)
sha512sums=('04336327c59c6e37ccf6a05046f5ca0ece5b513f03f5c42abcfb309f8b76b14f75d0021dd09c848396ae889849edbffaa5df790e542bcfca26cc727a70c4e810')

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

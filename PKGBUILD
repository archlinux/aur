# Mainteiner: Alexey Nurmukhametov [nurmukhametov] <echo YWxleEBudXJtdWtoYW1ldG92LnJ1Cg== | base64 -d>

pkgname=triton
_pkgname=Triton
pkgver=0.9
pkgrel=1
pkgdesc='Dynamic binary analysis framework'
url='https://triton.quarkslab.com/'
arch=('x86_64')
license=('Apache')
depends=('boost-libs' 'capstone' 'z3' 'python' 'llvm')
makedepends=('boost' 'cmake')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/JonathanSalwan/${_pkgname}/archive/v${pkgver}.tar.gz)
sha512sums=('f34cc9787837dc826e21997a86c32087b29ed9662bc8e0ac8ddb934978a64bdfd54c3d1303689be2a9dff4a0f3c9128219e04881e6c98f5e21a27ecd57489586')

build() {
  cd ${_pkgname}-${pkgver}
  cmake ./ -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd ${_pkgname}-${pkgver}
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:

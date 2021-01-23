# Maintainer: David Ellis <david@alantechnologies.com>
# Thanks to Andy Kluger <https://t.me/andykluger> for the initial version of this!
pkgname=alan
pkgver=0.1.25
pkgrel=1
pkgdesc="The Alan programming language compiler and runtime"
url="https://github.com/alantech/alan"
license=('AGPL3' 'Apache')
arch=('x86_64')
depends=()
makedepends=(git nodejs rust yarn npm)
# optdepends=()
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('556c94bb486eeb23059b8daa11732cb9f09ca7840aca515ec55c69cba91396d0')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p "${pkgdir}/usr/bin"
  cp ./avm/target/release/alan "${pkgdir}/usr/bin/alan"
}

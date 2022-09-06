# Maintainer: Juanjo Gutierrez <juanjo at gutierrezdequevedo dot com>
pkgname=ucsim
_basename=uCsim
pkgver=0.7.4
pkgrel=1
pkgdesc="Software simulator for microcontrollers"
arch=('x86_64' 'aarch64')
url="http://mazsola.iit.uni-miskolc.hu/~drdani/embedded/ucsim/"
license=('GPL2')
depends=()
source=("http://mazsola.iit.uni-miskolc.hu/ucsim/download/v0.7.x/${pkgname}_${pkgver}_orig.tar.gz")
sha256sums=('bbf5152149ad1ecf8d9024791357e40f5a3585366b0d99c701078a676ca1f974')
makedepends=('flex' 'bison' 'gcc' 'make')

prepare() {
    cd "$pkgname-$pkgver"
    ./configure --prefix="/usr"
}

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}

# Contributor: Antonio Vázquez Blanco <antoniovazquezblanco@gmail.com>

pkgname=firebird-nspire
pkgver=0.30
pkgrel=1
pkgdesc='Community emulator of TI-Nspire calculators.'
arch=('i686' 'x86_64')
url='https://github.com/nspire-emus/firebird'
conflicts=('nspire_emu')
license=()
depends=()
makedepends=('qt5-declarative')
source=("$pkgname-$pkgver.tar.gz"::'https://github.com/nspire-emus/firebird/archive/v'$pkgver'.tar.gz')
md5sums=('b441ef38da179a7e48c407d47d5cf294')

build() {
  # Compile...
  cd "${srcdir}/firebird-${pkgver}"
  mkdir -p build
  cd build
  qmake ..
  make
}

package() {
  # Install...
  cd "${srcdir}/firebird-${pkgver}/build"
  INSTALL_ROOT="${pkgdir}" make install
}

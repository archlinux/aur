# Contributor: Andreas Baumann <mail at andreas baumann dot cc>

pkgname=cadius
pkgver=1.4.5
pkgrel=1
pkgdesc="BrutalDeluxe's Cadius ProDOS disk imaging utility (used for making Apple II disk images)"
arch=('x86_64')
url="https://www.brutaldeluxe.fr/products/crossdevtools/cadius/"
license=('GPL3')
depends=('qt6-base')
makedepends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/mach-kernel/cadius/archive/refs/tags/1.4.5.tar.gz")
sha256sums=('2c88bfa75a3b7ef0df81cfe69665a167228f78299a9885d5b2f0d92cb9ec55af')

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  install -d "${pkgdir}/usr/bin"
  make install DESTDIR="${pkgdir}" INSTALL_PREFIX=/usr
  install -D -m 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

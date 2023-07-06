# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>
# Contributor: Gavin Lloyd <gavinhungry@gmail.com>
# Contributor: xav <xav at ethetricks dot eu>

pkgname=tpmmanager
pkgver=0.9.0
pkgrel=1
pkgdesc="TPM management software providing an easy to use graphical user interface"
arch=('i686' 'x86_64')
url="https://github.com/Rohde-Schwarz/TPMManager"
license=(GPL2)
depends=('qt5' 'trousers')
source=(${pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz)
sha512sums=('bb094f6af52013b25859a346a4a5a49d49b187253d3e6e58d1962ef607744ce376e47b5ad858db3a5befb26ae9b6a98329182af098c497443885ffddb8562ae8')

build() {
  cd "TPMManager-${pkgver}"
  qmake-qt5 QMAKE_CFLAGS+=-fpermissive QMAKE_CXXFLAGS+=-fpermissive
  make
}

package() {
  cd "TPMManager-${pkgver}"
  install -D -m755 "bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

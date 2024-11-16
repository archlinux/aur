# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=conky-manager2
pkgver=2.7
pkgrel=1
pkgdesc="GUI for managing Conky config files with options to browse and edit themes"
url="https://github.com/zcot/conky-manager2"
arch=(x86_64)
license=(GPL-3.0-or-later)
depends=(gtk3 json-glib libgee p7zip conky)
makedepends=(git vala)
source=("git+https://github.com/zcot/conky-manager2.git#tag=v${pkgver}")
sha512sums=('SKIP')

build() {
  cd conky-manager2
  make
}

package() {
  cd conky-manager2
  make DESTDIR="${pkgdir}" install
  rm "${pkgdir}"/usr/bin/conky-manager2-uninstall
}


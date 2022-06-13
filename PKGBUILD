# Maintainer: Otto Sabart <aur@seberm.com>
# Maintainer: Olivier Medoc <o_medoc@yahoo.fr>

pkgname=qubes-vm-gui-common
_gitname=${pkgname%-git*}
pkgver=4.1.1
pkgrel=1
pkgdesc="Common files for Qubes GUI - protocol headers."
arch=("x86_64")
url="https://github.com/QubesOS/qubes-gui-common"
license=('GPL')
depends=()
makedepends=()
validpgpkeys=('0AF64C3B1F1214B38C8C57861FA2DBE674387CC3'  # Otto Sabart
              '0064428F455451B3EBE78A7F063938BA42CFA724'  # Marek Marczykowski-Górecki
              '427F11FD0FAA4B080123F01CDDFA1A3E36879494'  # Qubes Master Signing Key
)

source=("$_gitname::git+https://github.com/QubesOS/qubes-gui-common.git?signed#tag=v${pkgver}")

sha512sums=('SKIP')


package() {
  cd "${srcdir}/${_gitname}/"

  mkdir -p $pkgdir/usr/include
  cp include/*.h $pkgdir/usr/include/
}

# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: ninian <mcfadzean.org.uk ta linux>

pkgname=vuescan-bin
pkgver=9.7.59
pkgrel=1
pkgdesc="A powerful proprietary scanning tool developed by Hamrick Software"
arch=(i686 x86_64 armv6h aarch64)
url="https://www.hamrick.com/"
license=('custom')
depends=(gtk2 libsm libusb-compat)
options=(!strip) # required to accept registration details
source=(vuescan-LICENSE.txt)
source_i686=("vuescan-x32-$(date +%F-%H).rpm::https://www.hamrick.com/files/vuex3297.rpm")
source_x86_64=("vuescan-x64-$(date +%F-%H).rpm::https://www.hamrick.com/files/vuex6497.rpm")
source_aarch64=("vuescan-arm64-$(date +%F-%H).rpm::https://www.hamrick.com/files/vuea6497.rpm")
source_armv6h=("vuescan-arm32-$(date +%F-%H).rpm::https://www.hamrick.com/files/vuea3297.rpm")
sha256sums=('6dbe377ee83561ef0b12fec64dadb5c81beb1f9ee274284c09184366bad1a6d6')
sha256sums_i686=('26b59676e492438b87e5d5cb5f9efa333c5c83329accb1d1545c235a2bc0340e')
sha256sums_x86_64=('442819746b4e4f921a10b2218f25db607266a3be5f7977fc5fe46b3681d5ed15')
sha256sums_armv6h=('8abf7c9c7469d50f35262633848a18d552d0c1e11fbbac2f1a58f2024ed1f2a5')
sha256sums_aarch64=('0a7166bb1b0644319aef548b631d88271da30462cb5c50150d6be0af119c73ce')

package() {
  cp -a "${srcdir}"/usr "${pkgdir}"/
  cp -a "${srcdir}"/lib "${pkgdir}"/usr
  install -Dm644 "${srcdir}/vuescan-LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: ninian <mcfadzean.org.uk ta linux>

pkgname=vuescan-bin
pkgver=9.7.73
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
sha256sums_i686=('6145b4beb68d6a9dec5eb1369b453faf8d179309dd919b29ea01dfc083f1a653')
sha256sums_x86_64=('230f0d663f9a8d51f9f1149062d0d0607845d386af52660b403d4c94de1952d0')
sha256sums_armv6h=('ec69dfc0a494c7f9e9f8f89e4acb3bb78a0b51f23ddda1d924e1ffb3ba2760bf')
sha256sums_aarch64=('b592d9308f99162d2311af30619bd6654e173ac82f5d36d90ca6f787e21cad03')

package() {
  cp -a "${srcdir}"/usr "${pkgdir}"/
  cp -a "${srcdir}"/lib "${pkgdir}"/usr
  install -Dm644 "${srcdir}/vuescan-LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: ninian <mcfadzean.org.uk ta linux>

pkgname=vuescan-bin
pkgver=9.7.76
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
sha256sums_i686=('84a1ca6440d78d22e002937f1c9da3d27b7be02d12539d06d6bd61f13f0c3080')
sha256sums_x86_64=('f36fc29196bceca72b217919d01160119d39a79bfc33d8881c3c4ee5f37843c8')
sha256sums_armv6h=('ec69dfc0a494c7f9e9f8f89e4acb3bb78a0b51f23ddda1d924e1ffb3ba2760bf')
sha256sums_aarch64=('1e3d4d893ce024d121c57e8fdc0f2d3857f15f006d8f118097022822f157a41b')

package() {
  cp -a "${srcdir}"/usr "${pkgdir}"/
  cp -a "${srcdir}"/lib "${pkgdir}"/usr
  install -Dm644 "${srcdir}/vuescan-LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

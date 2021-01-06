# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: ninian <mcfadzean.org.uk ta linux>

pkgname=vuescan-bin
pkgver=9.7.40
pkgrel=1
pkgdesc="A powerful proprietary scanning tool developed by Hamrick Software"
arch=(i686 x86_64 armv6h aarch64)
url="https://www.hamrick.com/"
license=('custom')
depends=(gtk2 libsm libusb-compat)
options=(!strip) # required to accept registration details
source=(vuescan-LICENSE.txt)
source_i686=("$pkgname-x32-$(date +%F-%H).rpm::https://www.hamrick.com/files/vuex3297.rpm")
source_x86_64=("$pkgname-x64-$(date +%F-%H).rpm::https://www.hamrick.com/files/vuex6497.rpm")
source_aarch64=("$pkgname-arm64-$(date +%F-%H).rpm::https://www.hamrick.com/files/vuea6497.rpm")
source_armv6h=("$pkgname-arm32-$(date +%F-%H).rpm::https://www.hamrick.com/files/vuea3297.rpm")
sha256sums=('6dbe377ee83561ef0b12fec64dadb5c81beb1f9ee274284c09184366bad1a6d6')
sha256sums_i686=('10fabe03a00a3322c4459416cc6c29aee05c599db75fdbc4ee0e3f3da6b54aa2')
sha256sums_x86_64=('7646bd7ad609a468ce2d8813c9b8abca00d2dfd53d272a06e174e9a07750699d')
sha256sums_armv6h=('d9c2f31fbe4bb3532232e5c8e848235b09b76cb10361272c293a0bd8ba79bbef')
sha256sums_aarch64=('d0220b86d41303b709af260accafddcbbd483d90980ca905fa4329e9004ae0bd')

package() {
  cp -a "${srcdir}"/usr "${pkgdir}"/
  cp -a "${srcdir}"/lib "${pkgdir}"/usr
  install -Dm644 "${srcdir}/vuescan-LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: ninian <mcfadzean.org.uk ta linux>

pkgname=vuescan-bin
pkgver=9.7.48
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
sha256sums_i686=('e213769e5599891d13255f80a70997565114fdfdde2cf74551705c0583a650b5')
sha256sums_x86_64=('b7db247ea9763925e5d777ed5fda576a1bc59f96552d85ac90d0d710927fc7a1')
sha256sums_armv6h=('eec20e22bec5e03bc89b03e4483fec312b710acb05f82c8269a881bb6a3dc240')
sha256sums_aarch64=('3b29887e6cc74def88d1b9da88fba042863ddd2f37994a9ac8a4c659d813fbbe')

#pkgver() {
#  printf "%s" "$(wget -qO- https://www.hamrick.com/alternate-versions.html | egrep '<a href.*[0-9]+\.[0-9]+' | head -1 | sed -E 's/^.*([0-9]+[.][0-9]+[.][0-9]+).*$/\1/')"
#}

package() {
  cp -a "${srcdir}"/usr "${pkgdir}"/
  cp -a "${srcdir}"/lib "${pkgdir}"/usr
  install -Dm644 "${srcdir}/vuescan-LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

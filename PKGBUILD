# Original author: Thomas Sowell <tom@fancydriving.org>
# Maintained by: Joseph Riches

pkgname=xf86-input-cmt
pkgdesc="Chromium OS multitouch input driver for Xorg X server"
pkgver=2.0.5
pkgrel=2
arch=(i686 x86_64)
url="https://github.com/hugegreenbug/xf86-input-cmt"
license=('custom:chromiumos')
depends=('xf86-input-evdev' 'xf86-input-cmt-setup' 'libgestures' 'libevdev' 'libevdevc')
provides=("xf86-input-cmt=$pkgver")
conflicts=('xf86-input-synaptics')
install=${pkgname}.install
options=('!emptydirs' '!strip')

source=('ChromiumOS_Licence.txt')
source_x86_64=('xf86-input-cmt_2.0.5-1ubuntu1_amd64.deb::https://launchpad.net/~hugegreenbug/+archive/ubuntu/cmt2/+files/xf86-input-cmt_2.0.5-1ubuntu1_amd64.deb')
source_i686=('xf86-input-cmt_2.0.5-1ubuntu1_i386.deb::https://launchpad.net/~hugegreenbug/+archive/ubuntu/cmt2/+files/xf86-input-cmt_2.0.5-1ubuntu1_i386.deb')

md5sums=('af314be4bf04a749665a07203b120f54')
md5sums_x86_64=('ea4cf785d988ccfc0957fd9423bbb779')
md5sums_i686=('e5477e04e3922c21be92ee1086fec440')

package() {
  echo "Extracting package..." 
  bsdtar -xf data.tar.xz -C "$pkgdir/"
  install -Dm644 ChromiumOS_Licence.txt "$pkgdir"/usr/share/licenses/xf86-input-cmt/LICENCE   
}

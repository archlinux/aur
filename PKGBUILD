pkgname=xf86-input-cmt
pkgdesc="Chromium OS multitouch input driver for Xorg X server"
pkgver=3.0
pkgrel=1
arch=(x86_64)
url="https://github.com/GalliumOS/xf86-input-cmt"
license=('custom:chromiumos')
depends=('xf86-input-evdev' 'xf86-input-cmt-setup' 'libgestures' 'libevdev' 'libevdevc')
conflicts=('xf86-input-synaptics')
install=${pkgname}.install
options=('!emptydirs' '!strip')
source=('https://apt.galliumos.org/pool/main/x/xf86-input-cmt/xserver-xorg-input-cmt_3.0_amd64.deb')
md5sums=('344998e4bca270d5dc7ad705137f1dbf')

package() {
  echo "Extracting package..." 
  bsdtar -xf data.tar.xz -C "$pkgdir/"
  install -Dm644 "$pkgdir"/usr/share/doc/xserver-xorg-input-cmt/copyright "$pkgdir"/usr/share/licenses/xf86-input-cmt/LICENCE
  mv "$pkgdir/lib/systemd" "$pkgdir/usr/lib/"
}

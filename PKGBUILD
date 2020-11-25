# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: ninian <mcfadzean.org.uk ta linux>

pkgname=vuescan-bin
pkgver=9.7.37
pkgrel=1
pkgdesc="A powerful proprietary scanning tool developed by Hamrick Software"
arch=(i686 x86_64 armv6h aarch64)
url="https://www.hamrick.com/"
license=('custom')
depends=(gtk2 libsm libusb-compat)
options=(!strip) # required to accept registration details
source=('LICENSE' 'vuescan.sh' 'vuescan.desktop')
source_i686=("$pkgname-x32-$(date +%F-%H-%M).tgz::https://www.hamrick.com/files/vuex3297.tgz")
source_x86_64=("$pkgname-x64-$(date +%F-%H-%M).tgz::https://www.hamrick.com/files/vuex6497.tgz")
source_aarch64=("$pkgname-arm64-$(date +%F-%H-%M).tgz::https://www.hamrick.com/files/vuea6497.tgz")
source_armv6h=("$pkgname-arm32-$(date +%F-%H-%M).tgz::https://www.hamrick.com/files/vuea3297.tgz")
sha256sums=('6dbe377ee83561ef0b12fec64dadb5c81beb1f9ee274284c09184366bad1a6d6'
            'a536feed770fa379b3ea0147721a74ad5f19db493c098eec570d363b70f0847d'
            '211d104dc5e23530298d25ef0ae3760863b3f97113a1e80b228c866f576381ef')
sha256sums_i686=('94f49c41590ff1499475876fc59e6811450b800ab9832e79bc5c69a7e25f796d')
sha256sums_x86_64=('6f86b8e0bb5b5b8ef70411d16e7b5f52855d5a6c01f7a9868e44a352ae4d7647')
sha256sums_armv6h=('d0e21620ac3c37de0783acd57da9e5a0a37572282ce903e242bedecc0807243d')
sha256sums_aarch64=('227c863733c01616f9d1b3dcfd3698562deb0b024f1ecbdea978704fcb62e21c')

package() {
  install -d "$pkgdir/opt/${pkgname%-bin}"
  cp -a "$srcdir/VueScan"/* "$pkgdir/opt/${pkgname%-bin}/"
  install -Dm755 "$srcdir/${pkgname%-bin}.sh" "$pkgdir/usr/bin/${pkgname%-bin}"
  install -Dm644 "$srcdir/${pkgname%-bin}.desktop" "$pkgdir/usr/share/applications/${pkgname%-bin}.desktop"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
}

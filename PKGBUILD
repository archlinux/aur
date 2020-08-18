# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: ninian <mcfadzean.org.uk ta linux>

pkgname=vuescan-bin
pkgver=9.7.30
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
sha256sums_i686=('c6c635938ceaae340f1e16885e4e813eff5cb2d9e84cbb263b1e94dd736b345a')
sha256sums_x86_64=('3f8b101af12cb4d341f3523c26955d191e914acb74ff84541cf78a93525aa291')
sha256sums_armv6h=('06b73b5380830075197c41908d7221abe47333b14553616bcaa4e066c332219f')
sha256sums_aarch64=('3394280a5be274281233add9e00a3b6ffb643abbee858956166e94c0b877e936')

package() {
  install -d "$pkgdir/opt/${pkgname%-bin}"
  cp -a "$srcdir/VueScan"/* "$pkgdir/opt/${pkgname%-bin}/"
  install -Dm755 "$srcdir/${pkgname%-bin}.sh" "$pkgdir/usr/bin/${pkgname%-bin}"
  install -Dm644 "$srcdir/${pkgname%-bin}.desktop" "$pkgdir/usr/share/applications/${pkgname%-bin}.desktop"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
}

# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: ninian <mcfadzean.org.uk ta linux>

pkgname=vuescan-bin
pkgver=9.7.29
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
sha256sums_i686=('25385606944252bede039c55221a3f97a0039cb0ce33b35df015a1ad038e776c')
sha256sums_x86_64=('61b8c2d900fba4cc229069fae8c6e622c7901b9d2cadf2e78110bb628638f83d')
sha256sums_armv6h=('db1c0ccf3cbeb1661507566238a2a05422e38d58c7fdc46e3214c5070920101a')
sha256sums_aarch64=('736f57522b913fc84a457bcc793f8e1c1932c0f8faa13c5f6d4baee18bda9eca')

package() {
  install -d "$pkgdir/opt/${pkgname%-bin}"
  cp -a "$srcdir/VueScan"/* "$pkgdir/opt/${pkgname%-bin}/"
  install -Dm755 "$srcdir/${pkgname%-bin}.sh" "$pkgdir/usr/bin/${pkgname%-bin}"
  install -Dm644 "$srcdir/${pkgname%-bin}.desktop" "$pkgdir/usr/share/applications/${pkgname%-bin}.desktop"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
}

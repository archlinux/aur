# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: ninian <mcfadzean.org.uk ta linux>

pkgname=vuescan-bin
pkgver=9.7.27
pkgrel=1
pkgdesc="A powerful proprietary scanning tool developed by Hamrick Software"
arch=(i686 x86_64 armv6h aarch64)
url="http://www.hamrick.com/"
license=('custom')
depends=(gtk2 libsm libusb-compat)
options=(!strip) # required to accept registration details
source=('LICENSE' 'vuescan.sh' 'vuescan.desktop')
source_i686=("$pkgname-x32-$(date +%F-%H-%M).tgz::http://www.hamrick.com/files/vuex3297.tgz")
source_x86_64=("$pkgname-x64-$(date +%F-%H-%M).tgz::http://www.hamrick.com/files/vuex6497.tgz")
source_aarch64=("$pkgname-arm64-$(date +%F-%H-%M).tgz::https://www.hamrick.com/files/vuea6497.tgz")
source_armv6h=("$pkgname-arm32-$(date +%F-%H-%M).tgz::https://www.hamrick.com/files/vuea3297.tgz")
sha256sums=('05bdfea92e72d09167900f79c28c0c643b6f56f940b93082f05d5ba763bd2407'
            'a536feed770fa379b3ea0147721a74ad5f19db493c098eec570d363b70f0847d'
            '211d104dc5e23530298d25ef0ae3760863b3f97113a1e80b228c866f576381ef')
sha256sums_i686=('0ab78a5ffc05df3df43329a0cd11147adb74341d37ca1e719965d1e67d13452e')
sha256sums_x86_64=('4e2d990236a96f94d5c703c402ac180b47d5b571134dc32590eb4524b7c8ab8b')
sha256sums_armv6h=('8ae20d538f988b32957b6c2ff773c1a70ccde65dacb8f54340c4fa3e421bdc89')
sha256sums_aarch64=('dc5560b26e75923b5afd19d18ea490cc705bf7777f6c3f44c6dda93346c7423b')

package() {
  install -d "$pkgdir/opt/${pkgname%-bin}"
  cp -a "$srcdir/VueScan"/* "$pkgdir/opt/${pkgname%-bin}/"
  install -Dm755 "$srcdir/${pkgname%-bin}.sh" "$pkgdir/usr/bin/${pkgname%-bin}"
  install -Dm644 "$srcdir/${pkgname%-bin}.desktop" "$pkgdir/usr/share/applications/${pkgname%-bin}.desktop"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
}

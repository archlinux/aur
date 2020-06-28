# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: ninian <mcfadzean.org.uk ta linux>

pkgname=vuescan-bin
pkgver=9.7.28
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
sha256sums_i686=('4bc5156b85fe0fb7e24a68fdebe0525e8114f90a39157459e9eda9d6977dc55f')
sha256sums_x86_64=('101b1738bf2090c81372194079cdd510c2f02c54ee106d66737df0a3d652651b')
sha256sums_armv6h=('615d829ae38d7bc25fb0cee1e17966182d83e5d9903766df204a34e05bc4815f')
sha256sums_aarch64=('62d7e13614bc3b959d73a754b3bdd06fbe6010012215a26560f91460347ce24f')

package() {
  install -d "$pkgdir/opt/${pkgname%-bin}"
  cp -a "$srcdir/VueScan"/* "$pkgdir/opt/${pkgname%-bin}/"
  install -Dm755 "$srcdir/${pkgname%-bin}.sh" "$pkgdir/usr/bin/${pkgname%-bin}"
  install -Dm644 "$srcdir/${pkgname%-bin}.desktop" "$pkgdir/usr/share/applications/${pkgname%-bin}.desktop"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
}

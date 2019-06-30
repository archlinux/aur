# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org>
# Contributor: ninian <mcfadzean.org.uk ta linux>

pkgname=vuescan-bin
pkgver=9.6.x
pkgrel=1
pkgdesc="A powerful proprietary scanning tool developed by Hamrick Software"
arch=(i686 x86_64)
url="http://www.hamrick.com/"
license=('custom')
depends=(gtk2 libsm libusb-compat)
options=(!strip) # required to accept registration details
source=('LICENSE' 'vuescan.sh' 'vuescan.desktop')
source_i686=("$pkgname-32-$(date +%F-%H).tgz::http://www.hamrick.com/files/vuex3296.tgz")
source_x86_64=("$pkgname-64-$(date +%F-%H).tgz::http://www.hamrick.com/files/vuex6496.tgz")
sha256sums=('05bdfea92e72d09167900f79c28c0c643b6f56f940b93082f05d5ba763bd2407'
            'ec57417c4b8fe9375549959ee42f8bb5e70922e3dfa2ae329336e537b1725569'
            '211d104dc5e23530298d25ef0ae3760863b3f97113a1e80b228c866f576381ef')
# Skip checksum as package always provides latest version regardless
sha256sums_i686=('SKIP')
sha256sums_x86_64=('SKIP')

package() {
  install -d "$pkgdir/opt/${pkgname%-bin}"
  cp -a "$srcdir/VueScan"/* "$pkgdir/opt/${pkgname%-bin}/"
  install -Dm755 "$srcdir/${pkgname%-bin}.sh" "$pkgdir/usr/bin/${pkgname%-bin}"
  install -Dm644 "$srcdir/${pkgname%-bin}.desktop" "$pkgdir/usr/share/applications/${pkgname%-bin}.desktop"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
}

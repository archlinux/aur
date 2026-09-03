pkgname=polaris-gamestream-bin
pkgver=1.4.1
pkgrel=1
pkgdesc="Linux-first game streaming host"
arch=('x86_64')
url="https://github.com/papi-ux/polaris"
license=('GPL3')
depends=('miniupnpc')
source=("Polaris-arch-x86_64-1.4.1.pkg.tar.zst::https://github.com/papi-ux/polaris/releases/download/v1.4.1/Polaris-arch-x86_64.pkg.tar.zst")
noextract=("Polaris-arch-x86_64-1.4.1.pkg.tar.zst")
sha256sums=('6bf02df60a57e0e0f9d776c09fddb5852f74419045613ecd2c3004da064789ea')
install=polaris-gamestream-bin.install

package() {
  bsdtar -xf "Polaris-arch-x86_64-1.4.1.pkg.tar.zst" -C "$pkgdir"
  # ensure no pacman metadata leaks
  find "$pkgdir" -name ".PKGINFO" -delete
  find "$pkgdir" -name ".BUILDINFO" -delete
  find "$pkgdir" -name ".MTREE" -delete
  find "$pkgdir" -name ".INSTALL" -delete
}

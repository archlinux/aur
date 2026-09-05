pkgname=polaris-gamestream-bin
pkgver=1.4.2
pkgrel=1
pkgdesc="Linux-first game streaming host"
arch=('x86_64')
url="https://github.com/papi-ux/polaris"
license=('GPL3')
depends=('miniupnpc')
source=("Polaris-arch-x86_64-1.4.2.pkg.tar.zst::https://github.com/papi-ux/polaris/releases/download/v1.4.2/Polaris-arch-x86_64.pkg.tar.zst")
noextract=("Polaris-arch-x86_64-1.4.2.pkg.tar.zst")
sha256sums=('b82519ecd629527220aba1dc26b0e95f8b8ef6af2c77eb30a1b2833cb72cd89f')
install=polaris-gamestream-bin.install

package() {
  bsdtar -xf "Polaris-arch-x86_64-1.4.2.pkg.tar.zst" -C "$pkgdir"
  # ensure no pacman metadata leaks
  find "$pkgdir" -name ".PKGINFO" -delete
  find "$pkgdir" -name ".BUILDINFO" -delete
  find "$pkgdir" -name ".MTREE" -delete
  find "$pkgdir" -name ".INSTALL" -delete
}

# Maintainer: David Vilar Benet <archlinux at b0rken dot de>
# Contributor: brent s. <bts[at]square-r00t[dot]net>

pkgname=storcli
pkgver=007.1715.0000.0000
pkgrel=1
pkgdesc="CLI program for LSI MegaRAID cards"
url="https://www.broadcom.com/"
license=('custom')
arch=('any')
source=("$pkgname-$pkgver.zip::https://docs.broadcom.com/docs-and-downloads/raid-controllers/raid-controllers-common-files/${pkgver}_Unified_StorCLI-PUL.zip")
sha512sums=('79dbd5f2ded4897a3d867bbab76d415b8532a647fc12f369f667e11e772b398954a2d762a011c37ab7a18b4759c3c1f8408d129ceb9b1ae62bce4671380eb988')

package() {
  # bsdtar -poxf "$srcdir/Unified_storcli_all_os/Linux/$pkgname-$pkgver-1.noarch.rpm" -C "$pkgdir"
  bsdtar -poxf "$srcdir/Unified_storcli_all_os/Linux/$pkgname-007.1705.0000.0000-1.noarch.rpm" -C "$pkgdir" # Yes, they wrap 007.1705.0000.0000 in 007.1715.0000.0000 :(

  install -dm755 "$pkgdir/usr/bin"
  ln -s /opt/MegaRAID/storcli/storcli64 "$pkgdir/usr/bin"

  install -dm755 "$pkgdir/usr/bin"
  ln -s /opt/MegaRAID/storcli/storcli "$pkgdir/usr/bin"

  install -Dm644 "$srcdir/Unified_storcli_all_os/ThirdPartyLicenseNotice.pdf" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.pdf"
}

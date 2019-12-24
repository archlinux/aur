# Maintainer: David Vilar Benet <archlinux at b0rken dot de>
# Past Maintainer: brent s. <bts[at]square-r00t[dot]net>

pkgname=storcli
pkgver=007.1108.0000.0000
pkgrel=1
pkgdesc="CLI program for LSI MegaRAID cards"
url="https://www.broadcom.com/"
license=('custom')
arch=('any')
source=("$pkgname-$pkgver.zip::https://docs.broadcom.com/docs-and-downloads/raid-controllers/raid-controllers-common-files/MR_SAS_Unified_StorCLI_007.1108.0000.0000.zip")
sha512sums=('74c6dedef30e8c4a49a3167e2378cd196429d5c76c840696163faebe4726ca788bf0cab52b69676c5db319e9b76cb34e626684ae71bec5915ea0b663d6f4172b')

package() {
  bsdtar -poxf "$srcdir/Linux/$pkgname-$pkgver-1.noarch.rpm" -C "$pkgdir"

  install -dm755 "$pkgdir/usr/bin"
  ln -s /opt/MegaRAID/storcli/storcli64 "$pkgdir/usr/bin"

  install -dm755 "$pkgdir/usr/bin"
  ln -s /opt/MegaRAID/storcli/storcli "$pkgdir/usr/bin"

  install -Dm644 "$srcdir/Linux/license.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer: dvb <archlinux at b0rken dot de>
# Contributor: brent s. <bts[at]square-r00t[dot]net>

pkgname=storcli
pkgver=007.2203.0000.0000
pkgrel=1
pkgdesc="CLI program for LSI MegaRAID cards"
url="https://www.broadcom.com/"
license=('custom')
arch=('x86_64')
source=("$pkgname-$pkgver.zip::https://docs.broadcom.com/docs-and-downloads/raid-controllers/raid-controllers-common-files/${pkgver}_Unified_StorCLI.zip")
sha512sums=('d0fb91b1ee28d4c32df434b9059d7b2201206c2ccfee93aa03da7871ef84c18a1dfda1a3857099f6284caea782fbcb38c35506106ac682736127ae7cea91a85b')

package() {
  bsdtar -poxf "$srcdir/Linux/$pkgname-$pkgver-1.noarch.rpm" -C "$pkgdir"
  rm "$pkgdir/opt/MegaRAID/storcli/storcli"

  install -dm755 "$pkgdir/usr/bin"
  install -Dm644 "$srcdir/ThirdPartyLicenseNotice.pdf" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.pdf"

  ln -s /opt/MegaRAID/storcli/storcli64 "$pkgdir/usr/bin"
  ln -s /opt/MegaRAID/storcli/storcli64 "$pkgdir/usr/bin/storcli"
}

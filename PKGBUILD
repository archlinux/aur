# Maintainer: dvb <archlinux at b0rken dot de>
# Contributor: brent s. <bts[at]square-r00t[dot]net>

pkgname=storcli
pkgver=007.2007.0000.0000
pkgrel=1
pkgdesc="CLI program for LSI MegaRAID cards"
url="https://www.broadcom.com/"
license=('custom')
arch=('x86_64')
source=("$pkgname-$pkgver.zip::https://docs.broadcom.com/docs-and-downloads/raid-controllers/raid-controllers-common-files/${pkgver}_Unified_StorCLI-PUL.zip")
sha512sums=('fdb6fd3727a7e2f772afbb19d2b0e974d1dd291dd244478be3ce68cc7ace77c0fba722b7b52289dd5f4b17771237917705a9c99c42b03bca4cb8cb3e4ce8b6fa')

package() {
  bsdtar -poxf "$srcdir/Unified_storcli_all_os/Linux/$pkgname-$pkgver-1.noarch.rpm" -C "$pkgdir"
  rm "$pkgdir/opt/MegaRAID/storcli/storcli"

  install -dm755 "$pkgdir/usr/bin"
  install -Dm644 "$srcdir/Unified_storcli_all_os/ThirdPartyLicenseNotice.pdf" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.pdf"

  ln -s /opt/MegaRAID/storcli/storcli64 "$pkgdir/usr/bin"
  ln -s /opt/MegaRAID/storcli/storcli64 "$pkgdir/usr/bin/storcli"
}

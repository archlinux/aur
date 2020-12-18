# Maintainer: David Vilar Benet <archlinux at b0rken dot de>
# Past Maintainer: brent s. <bts[at]square-r00t[dot]net>

pkgname=storcli
pkgver=007.1508.0000.0000
pkgrel=1
pkgdesc="CLI program for LSI MegaRAID cards"
url="https://www.broadcom.com/"
license=('custom')
arch=('any')
source=("$pkgname-$pkgver.zip::https://docs.broadcom.com/docs-and-downloads/raid-controllers/raid-controllers-common-files/${pkgver}_Unified_StorCLI-PUL.zip")
sha512sums=('43565cc695e9e7a7725474ab8091ea00de8fde7fabffe708c45e4c0e8713b1fcb1a5a25963bba44974b7787bebc06a59f3b8180416fefb0a54b4fd403c6152be')

package() {
  bsdtar -poxf "$srcdir/Unified_storcli_all_os/Linux/$pkgname-$pkgver-1.noarch.rpm" -C "$pkgdir"

  install -dm755 "$pkgdir/usr/bin"
  ln -s /opt/MegaRAID/storcli/storcli64 "$pkgdir/usr/bin"

  install -dm755 "$pkgdir/usr/bin"
  ln -s /opt/MegaRAID/storcli/storcli "$pkgdir/usr/bin"

  install -Dm644 "$srcdir/Unified_storcli_all_os/ThirdPartyLicenseNotice.pdf" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.pdf"
}

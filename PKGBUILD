# Maintainer: dvb <archlinux at b0rken dot de>
# Contributor: brent s. <bts[at]square-r00t[dot]net>

pkgname=storcli
pkgver=007.1804.0000.0000
pkgrel=1
pkgdesc="CLI program for LSI MegaRAID cards"
url="https://www.broadcom.com/"
license=('custom')
arch=('any')
source=("$pkgname-$pkgver.zip::https://docs.broadcom.com/docs-and-downloads/raid-controllers/raid-controllers-common-files/${pkgver}_Unified_StorCLI-PUL.zip")
sha512sums=('fd47759c757f61193fd449cb5ea6d33ccfb9ec239176fa4f4d5997afc62e168f0cd24fe9910d8c8fd3a65d2386fbbaa78ac13d53fca2e82c294eea2f45219a3b')

package() {
  bsdtar -poxf "$srcdir/Unified_storcli_all_os/Linux/$pkgname-$pkgver-1.noarch.rpm" -C "$pkgdir"

  install -dm755 "$pkgdir/usr/bin"
  ln -s /opt/MegaRAID/storcli/storcli64 "$pkgdir/usr/bin"

  install -dm755 "$pkgdir/usr/bin"
  ln -s /opt/MegaRAID/storcli/storcli "$pkgdir/usr/bin"

  install -Dm644 "$srcdir/Unified_storcli_all_os/ThirdPartyLicenseNotice.pdf" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.pdf"
}

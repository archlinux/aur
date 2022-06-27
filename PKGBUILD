# Maintainer: dvb <archlinux at b0rken dot de>
# Contributor: brent s. <bts[at]square-r00t[dot]net>

pkgname=storcli
pkgver=007.2106.0000.0000
pkgrel=1
pkgdesc="CLI program for LSI MegaRAID cards"
url="https://www.broadcom.com/"
license=('custom')
arch=('x86_64')
source=("$pkgname-$pkgver.zip::https://docs.broadcom.com/docs-and-downloads/raid-controllers/raid-controllers-common-files/${pkgver}_Unified_StorCLI.zip")
sha512sums=('3583ca529a7840b3223b593931aa50947b282bd5757c3d1eaf7d68fd45771d875fe598ff6ec09dd64e80ff833c8b63b8fd155a4aa2e0dd0dc43ee93d90dff2d7')

package() {
  bsdtar -poxf "$srcdir/Unified_storcli_all_os/Linux/$pkgname-$pkgver-1.noarch.rpm" -C "$pkgdir"
  rm "$pkgdir/opt/MegaRAID/storcli/storcli"

  install -dm755 "$pkgdir/usr/bin"
  install -Dm644 "$srcdir/Unified_storcli_all_os/ThirdPartyLicenseNotice.pdf" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.pdf"

  ln -s /opt/MegaRAID/storcli/storcli64 "$pkgdir/usr/bin"
  ln -s /opt/MegaRAID/storcli/storcli64 "$pkgdir/usr/bin/storcli"
}

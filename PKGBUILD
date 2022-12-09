# Maintainer: dvb <archlinux at b0rken dot de>
# Contributor: brent s. <bts[at]square-r00t[dot]net>

pkgname=storcli
pkgver=007.2309.0000.0000
_pkgver=7.2309.0000.0000
pkgrel=1
pkgdesc="CLI program for LSI MegaRAID cards"
url="https://www.broadcom.com/"
license=('custom')
arch=('x86_64')
source=("$pkgname-$pkgver.zip::https://docs.broadcom.com/docs-and-downloads/raid-controllers/raid-controllers-common-files/Unified_storcli_all_os_${_pkgver}.zip")
sha512sums=('c922fe3889a4035e4b25c4228bc5bcaf6a94db6ea247170c8dd3735c953b735c4129cb9d0b7818b2ec63d98f1b21ccab6d4937a2c4e160c0077eb604fb24cf57')

package() {
  bsdtar -poxf "$srcdir/Unified_storcli_all_os/Linux/$pkgname-$pkgver-1.noarch.rpm" -C "$pkgdir"
  rm "$pkgdir/opt/MegaRAID/storcli/storcli"

  install -dm755 "$pkgdir/usr/bin"
  install -Dm644 "$srcdir/Unified_storcli_all_os/ThirdPartyLicenseNotice.pdf" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.pdf"

  ln -s /opt/MegaRAID/storcli/storcli64 "$pkgdir/usr/bin"
  ln -s /opt/MegaRAID/storcli/storcli64 "$pkgdir/usr/bin/storcli"
}

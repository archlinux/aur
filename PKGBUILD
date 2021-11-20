# Maintainer: dvb <archlinux at b0rken dot de>
# Contributor: brent s. <bts[at]square-r00t[dot]net>

pkgname=storcli
pkgver=007.1907.0000.0000
pkgrel=1
pkgdesc="CLI program for LSI MegaRAID cards"
url="https://www.broadcom.com/"
license=('custom')
arch=('x86_64')
source=("$pkgname-$pkgver.zip::https://docs.broadcom.com/docs-and-downloads/raid-controllers/raid-controllers-common-files/${pkgver}_Unified_StorCLI-PUL.zip")
sha512sums=('77558b3f2e51014addd92581cf0409022c10dcd7395ad6f4a5ddc36b2d17e967300ff6ab1d0bcd29b66d4775620b275e49cca63b0a81e9454dbb3eede268c67c')

package() {
  bsdtar -poxf "$srcdir/Unified_storcli_all_os/Linux/$pkgname-$pkgver-1.noarch.rpm" -C "$pkgdir"
  rm "$pkgdir/opt/MegaRAID/storcli/storcli"

  install -dm755 "$pkgdir/usr/bin"
  install -Dm644 "$srcdir/Unified_storcli_all_os/ThirdPartyLicenseNotice.pdf" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.pdf"

  ln -s /opt/MegaRAID/storcli/storcli64 "$pkgdir/usr/bin"
  ln -s /opt/MegaRAID/storcli/storcli64 "$pkgdir/usr/bin/storcli"
}

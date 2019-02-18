# Maintainer: qaz <fkxxyz@163.com>
# Contributor: qaz <fkxxyz@163.com>

pkgname=feem
pkgver=4.3.0
pkgrel=0
pkgdesc="Share Files OFFLINE! No Cloud. No Servers. No Limits."
arch=("x86_64")
url="https://www.feem.io/"
license=('custom')
depends=('qt5-webkit' 'hicolor-icon-theme')
optdepends=('gstreamer: multimedia support')
source=(
  "https://f000.backblazeb2.com/file/feemdownloads/Feem_v${pkgver}_For_Linux.AppImage"
)

package() {
  cd ${srcdir}

  install -d ${pkgdir}/usr/share

  cp -a ./usr/share/icons ${pkgdir}/usr/share/icons
  cp -a ./usr/share/applications ${pkgdir}/usr/share/applications

  install -D ./opt/feem/bin/Feem ${pkgdir}/usr/bin/feem

  install -d ${pkgdir}/usr/share/licenses/$pkgname
  echo '

© FeePerfect. All rights reserved.

Created By Fritz Ekwoge
From the beautiful city of Buea, Cameroon.

About Us
	We are FeePerfect. A small, high-tech company providing innovative ideas 
	for people and businesses. We are based in Cameroon, Africa. Our award 
	winning products help people solve problems that they deal with each and 
	every day. We will always work hard to please our customers and are always 
	happy to do business with you.

Send us an email: info@feeperfect.com and we''ll be glad to help.
' >${pkgdir}/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
sha256sums=('69d243207bf482f94c16ae22ba10060221b2b74332141d9edc080397b75d68e8')

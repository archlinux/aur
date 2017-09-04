# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>

pkgname=pocketsmith-bin
_pkgname=pocketsmith
pkgdesc="Personal finance software with cash flow forecasts"
pkgver=0.1.2
pkgrel=1
arch=('i686' 'x86_64')
url='https://www.pocketsmith.com/'
license=('custom')
depends=('gconf' 'nss' 'alsa-lib' 'libxtst' 'gtk2' 'libxss')
options=(!strip !emptydirs)
source_i686=("https://d17qi61ltj6gb6.cloudfront.net/${pkgver}/${_pkgname}_${pkgver}_i386.deb")
source_x86_64=("https://d17qi61ltj6gb6.cloudfront.net/${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums_i686=('ea33a23d8b7f0cfcf12dfcd5893058057a4adf1b89e8a022cd606aecc58a3b22')
sha256sums_x86_64=('888f824b5e1245baf8f604e6066774c96891278cce5d9628a2bd918081edf262')

package() {
  bsdtar xf data.tar.xz -C "$pkgdir" 

  # fix directory permissions
  find "$pkgdir" -type d -exec chmod 755 "{}" +

  # move license to expected dir
  mkdir "$pkgdir/usr/share/licenses/"
  mv "$pkgdir/usr/share/doc/pocketsmith/" "$pkgdir/usr/share/licenses/pocketsmith-bin/"
}

# Maintainer: yaroslav <proninyaroslav@mail.ru>
# Contributor: stanislaw <i@archuser.pp.ru>
# Contributor: wido <widomaker2k7@gmail.com>
# Contributor: Nebulosa <nebulosa2007 na yandekse>
# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>

pkgname=2gis
pkgver=3.15.7.0
pkgrel=1
pkgdesc="Geographic Information System (GIS) for some Russian and Ukrainian cities."
arch=('i686' 'x86_64')
url="http://help.2gis.ru/linux/"
license=('Adware')
depends_x86_64=('wine>=1.5' 'lib32-libldap' 'lib32-libxml2' 'hicolor-icon-theme')
depends_i686=('wine>=1.5' 'libxml2' 'hicolor-icon-theme')
makedepends=('xdg-utils')
install=2gis.install

source=("http://download.2gis.ru/arhives/2GISShell-${pkgver}.orig.zip"

	"2gis_16.png"
	"2gis_32.png"
	"2gis_48.png"
	"2gis_64.png"
	"2gis_128.png"
	"2gis_256.png"

	"2gis-launch"
	"2gis.desktop"
	"LICENSE.ru"
	"LICENSE.ua")
sha256sums=('7af78d7ed4837dc1cddb81f76294f2637102b98bc6d0d8bb2b777112f6d2d977'

	'1bf3ca1fdc82e17b56aec1aa8ee9a42967a6f3e91eaf5313178399529c92f37f'
	'2a832905089d8fc36eaa6b6a150ae0b45d234676adff462bbb6658b1e0ae8ee5'
	'879abea0f85b061d0390fce0bf78d4a814feb5905703932b33e692be16fbe907'
	'7a4d50841be3034b334b61497dfcf9c0a5ccd193b98d3c0d66cad4e10210e3af'
	'51d32e194bbb07042e643ff8ed1e5cab31e3ff02cea6a5d49cd41cd594545099'
	'722f03d0a070abfd5da49a0b6f96e168ec4a9cb2d1d9e98c30f301360093523e'

	'6b01b53fe254c0afef2a39ae2e4f699120a4983ee557dad5e4c0a4638426902b'
	'3550306543bd232769a89b4fdeed03dacc934ba63733cc890ceb47461aa059e1'
	'6f8a3e019f514525ffc334878aea34a6b86a04bdbd968bc982aea9ca7805b32c'
	'8824e0d8e961a69266593ed0c7d1b63e43a5ec447ae594f4c272238ff8e4e23b')

package() {
  install -d $pkgdir/opt/2gis
  install -D -m755 -t $pkgdir/opt/2gis $srcdir/2gis/3.0/grym.exe
  install -d $pkgdir/opt/2gis/Plugins
  install -D -m644 -t $pkgdir/opt/2gis/Plugins $srcdir/2gis/3.0/Plugins/*.*
  install -D -m644 LICENSE.ru $pkgdir/usr/share/licenses/2gis/LICENSE.ru
  install -D -m644 LICENSE.ua $pkgdir/usr/share/licenses/2gis/LICENSE.ua
  for size in 16 32 48 64 128 256; do
    install -D -m644 2gis_${size}.png $pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/2gis.png
  done
  install -D -m644 2gis.desktop $pkgdir/usr/share/applications/2gis.desktop
  install -D -m755 2gis-launch $pkgdir/usr/bin/2gis
}

#Contributor: Fabio 'Lolix' Loli <lolix@disroot.org>
#Contributor: Archydan <daniel at dragusanu dot net>
#Contributor: Guglielmo De Concini <guglielmo dot deconcini at gmail dot com>

pkgname=xerox-phaser-6000-6010
pkgver=1.01_20110222
pkgrel=1
pkgdesc="Driver for Xerox Phaser 6000/6010 color laser printer"
url="http://www.support.xerox.com/support/phaser-6000/downloads/engb.html?operatingSystem=linux&fileLanguage=en_GB"
license=('custom:"XeroxEULA"')
arch=(i686 x86_64)
depends=(cups)
depends_i686=(libcups libstdc++5 libtiff libpng)
depends_x86_64=(lib32-libcups lib32-libstdc++5 lib32-libtiff lib32-libpng)
source=("${pkgname}-${pkgver}.zip::http://www.support.xerox.com/support/phaser-6000/file-redirect/enus.html?operatingSystem=linux&fileLanguage=en&contentId=116070"
        "https://raw.githubusercontent.com/FabioLolix/AUR-artifacts/master/XeroxEULA")
sha256sums=('3cb437d2a83fe18718ee73f0293cef17b7129f16e7302c94752e93b4e9152ff2'
            '0b4c700a15719e07766c44451c767f1470ab97bf466cc61b18b96aec5891fc7e')

package() {
  cd "rpm_${pkgver}"
  bsdtar -xf Xerox-Phaser_6000_6010-1.0-1.i686.rpm -C ${pkgdir}
  install -D -m644 $srcdir/XeroxEULA "${pkgdir}/usr/share/licenses/${pkgname}/XeroxEULA"
}

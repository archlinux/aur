# Maintainer: vn158 <vn158 at seznam dot cz>

pkgname=gemcraft0
pkgver=1.20
pkgrel=1
pkgdesc="Unleash your magic power and fight. The Gem of Eternity awaits you..."
arch=('i686' 'x86_64')
url="http://armorgames.com/play/3527/gemcraft-chapter-0"
license=('custom')
depends=("flashplayer-standalone")
makedepends=('imagemagick')
source=(${pkgname}.swf::http://cache.armorgames.com/files/games/gemcraft-chapter-0-3527.swf http://gameinabottle.com/favicon.ico ${pkgname} ${pkgname}.desktop)

md5sums=('ce3d8f0d5d28766542abf58b37c0bbaf'
         '14f045b8d2a7d75de7cdb27dd4e9d6cd'
         'c0f0ccee19a63336245269df56a44989'
         'd1eec9e315dcd99c1126b11f8fc698ab')
sha256sums=('6d51944b86a8d6b98a36667e204a2723c96adbf7914d9634cbac643f922790af'
            '7d6f3457786f44758f1e2e9fcd1aa0837d0392cf2358fc966d93a666f81b7d03'
            'df290b1fed66a7b53ee02ce3630f0e83c1503959951c5425f6cfd66f86b21671'
            'c1dd509659573f9e9d0427d6a8f675e67df0307c4820dbf0005cf237c95ebf85')

options=(!strip)

build () {
  convert favicon.ico ${pkgname}.png
}

package() {
  #if path contains d8krhj4kasdu3 extra features are allowed, it doesn't work with 1.21
  install -d "${pkgdir}"/usr/{bin,share/${pkgname}/d8krhj4kasdu3}
  install -d "${pkgdir}"/usr/share/applications
  install -m644 ${pkgname}.png "${pkgdir}"/usr/share/${pkgname}
  install -m644 ${pkgname}.swf "${pkgdir}"/usr/share/${pkgname}/d8krhj4kasdu3
  install -m644 ${pkgname}.desktop "${pkgdir}"/usr/share/applications
  install -m755 ${pkgname} "${pkgdir}"/usr/bin
}

# Maintainer: vn158 <vn158 at seznam dot cz>

pkgname=gemcraft1
pkgver=1.111A
pkgrel=1
pkgdesc="Create and combine magic gems, put them into your towers and banish the monsters back to hell!"
arch=('i686' 'x86_64')
url="http://armorgames.com/play/1716/gemcraft"
license=('custom')
depends=("flashplayer-standalone")
makedepends=('imagemagick')
#source=("http://cache.armorgames.com/files/games/gemcraft-1716.swf" $pkgname)
source=(http://gameinabottle.com/games/${pkgname}.swf http://gameinabottle.com/favicon.ico ${pkgname} ${pkgname}.desktop)

md5sums=('4ae0f6369520686ae1e8433ebe564170'
         '14f045b8d2a7d75de7cdb27dd4e9d6cd'
         'cade4ab4245725f2148b72326e550d7a'
         '5c2f2f548be56b4b97d4eda201a2f833')
sha256sums=('b7773ff1118aae4c36352e9d67e9430e36545b4255c5a3105ecfeef4957369ec'
            '7d6f3457786f44758f1e2e9fcd1aa0837d0392cf2358fc966d93a666f81b7d03'
            'e716a20a03b5c6560e7e9eeed1f656cbda3bfd1dafdfd26c8268bd1f00c5f554'
            '2f363dfdd53a54dd472edaf1e78252aa1270061d5b4448b1259b6f351c3dfd28')

options=(!strip)

build () {
  convert favicon.ico ${pkgname}.png
}

package() {
  #if path contains armorgames.com extra features are allowed, it doesn't work in 1.11
  install -d "${pkgdir}"/usr/{bin,share/${pkgname}/armorgames.com}
  install -d "${pkgdir}"/usr/share/applications
  install -m644 ${pkgname}.swf "${pkgdir}"/usr/share/${pkgname}/armorgames.com
  install -m644 ${pkgname}.png "${pkgdir}"/usr/share/${pkgname}/armorgames.com
  install -m644 ${pkgname}.desktop "${pkgdir}"/usr/share/applications

  install -m755 ${pkgname} "${pkgdir}"/usr/bin
}

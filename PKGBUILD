# Maintainer: DeepChirp <deepchirp@archlinuxcn.org>
# The Chinese version of the game files were obtained from <https://tieba.baidu.com/p/6642167515>

pkgname=gemcraft-lost-chapter-labyrinth-zh
_pkgname=gemcraft-lost-chapter-labyrinth
pkgver=1.23
pkgrel=1
pkgdesc="Unleash your magic power and fight. The Gem of Eternity awaits you... (Chinese version)"
arch=('i686' 'x86_64')
url="https://www.gemcraftgame.com/"
license=('custom')
depends=("ruffle")
makedepends=('imagemagick')
swf_name="gemcraft-lost-chapter-labyrinth.swf"
source=("https://resource.deepchirp.com/${swf_name}" http://gameinabottle.com/favicon.ico ${_pkgname} ${_pkgname}.desktop)
conflicts=("${_pkgname}")

md5sums=('ea58972f9e80965afec4e512e230a776'
         '14f045b8d2a7d75de7cdb27dd4e9d6cd'
         'a5424fcf68548661c6722afb1bca5570'
         'db16b37d33d93cbf22a818c00bd939e8')
sha256sums=('c8aabd72c13f75ecf44236568fa4cde5c450c8bfc10e41e7542d1fda6bc3d591'
            '7d6f3457786f44758f1e2e9fcd1aa0837d0392cf2358fc966d93a666f81b7d03'
            '03dfb5ec49238d300d8c2234ab8e436941ea153607237e0343fb71caa2e7204b'
            '7b92ff876f1f73e92029e06876aa7a559ff1112388805f73e96695124616c562')

options=(!strip)

build () {
  magick favicon.ico ${_pkgname}.png
}

package() {
  install -d "${pkgdir}"/usr/{bin,share/${_pkgname}}
  install -d "${pkgdir}"/usr/share/applications
  install -m644 ${_pkgname}.png "${pkgdir}"/usr/share/${_pkgname}
  install -m644 "${swf_name}" "${pkgdir}"/usr/share/${_pkgname}
  install -m644 ${_pkgname}.desktop "${pkgdir}"/usr/share/applications
  install -m755 ${_pkgname} "${pkgdir}"/usr/bin
}

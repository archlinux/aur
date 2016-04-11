# Maintainer: Franklyn Tackitt <franklyn@tackitt.net>
pkgname=ttf-zelda
pkgver=1.0
pkgrel=1
pkgdesc="A collection of fonts from the Legend of Zelda universe"
arch=('any')
url="http://www.zeldauniverse.net/media/fonts/"
license=('GPL')
makedepends=('fontforge')
depends=('fontconfig' 'xorg-font-utils')
noextract=()

_source_base_url=http://www.zeldauniverse.net/media-files/typography/
source=("${_source_base_url}Triforce.ttf"
        "${_source_base_url}HylianSymbols.ttf"
        "${_source_base_url}Pretendo.ttf"
        "${_source_base_url}ContinuumRegular.ttf"
        "${_source_base_url}Gamecuben.ttf"
        "${_source_base_url}Ravenna.ttf"
        "${_source_base_url}AncientHylian.otf"
        "${_source_base_url}AmericanUncDRegular.ttf"
        "${_source_base_url}SherwoodRegular.ttf"
        "${_source_base_url}Hylian64.ttf"
        "${_source_base_url}ZeldaDXTTBRK.ttf"
        "${_source_base_url}ReturnofGanon.ttf"
        "http://www.zeldauniverse.net/wp-content/uploads/2012/01/skyward_sword_ancient_hylian___font_by_sarinilli-d4l1t18.zip"
        "zelda-ttf.install"
        "otftottf.sh")
md5sums=('3cf0469a6f23aefd25032f8bbc3587e5'
         'f6f44f2d7890f20ec62ecdae68c249f3'
         '487390d5558cff7a17ce35d7d92a0540'
         'ac5b280746e5eee7d336afd6f68ec437'
         'd2639bbd2646a188110e8270ec817322'
         '99f4b3cf2f8cad37b9463e3b1ff62a5f'
         'd4d1dfbaec37f60aea2f94359fac262c'
         'd3ecd5efc0b0583518b34e1ebe3f944f'
         '11f9580820728d8dc9655421a95f026a'
         '09559edd2f5b684a8587b094d7a95f1d'
         '630456bff8d3c11ea4511ef8b7184ae3'
         '3c27910b481c2d2f780ce08ab2532038'
         '7354ad6c714b905caec1cf1d7b6301c4'
         '1f43fbf275c7ee8ee236d9f90c970819'
         '529a3d904f5d2cbeacdba92999b6c44e')

install="zelda-ttf.install"

build() {
  cd "$srcdir"
  for otf in *.otf; do
    ./otftottf.sh $otf
  done
}

check() {
  msg "Checking"
}

package() {
  cd "$srcdir"
  find . -name \*.ttf -exec install -Dm644 '{}' "$pkgdir/usr/share/fonts/TTF/{}" \;
  find . -name \*.ttf -exec install -Dm644 '{}' "$pkgdir/usr/share/fonts/TTF/{}" \;
}

# Maintainer: robertfoster
pkgname=megabasterd-bin
_name=MegaBasterd
pkgver=7.74
pkgrel=1
pkgdesc="Yet another (unofficial) cross-platform MEGA downloader/uploader/streaming suite"
arch=('any')
url="https://github.com/tonikelope/megabasterd"
license=('GPL3')
depends=('java-runtime')
source=("${url}/releases/download/v${pkgver}/${_name}_${pkgver}.jar"
  "${pkgname%%-bin}.sh"
  "${pkgname%%-bin}.desktop"
)

package() {
  cd "$srcdir"

  install -Dm644 "${_name}_$pkgver.jar" \
    "$pkgdir/usr/share/java/${pkgname%%-bin}/${pkgname%%-bin}.jar"
  install -Dm755 "${pkgname%%-bin}.sh" \
    "$pkgdir/usr/bin/${pkgname%%-bin}"
  install -Dm644 "images/pica_roja_big.png" \
    "$pkgdir/usr/share/pixmaps/${pkgname%%-bin}.png"
  install -Dm644 "${pkgname%%-bin}.desktop" \
    "$pkgdir/usr/share/applications/${pkgname%%-bin}.desktop"
}

sha256sums=('905c4ca9dc0cb7079b39fc7ef34c30524893c8caccb1ed3c7df7a8b08702bf79'
            '72c7a1db49c5e58a6e6400a445758f7779a594789705dfeac954171d457af103'
            'a85b49dab7f58ab3c3b3e609a1c3c8e0fab2bedf5597a179aae82773681e7753')

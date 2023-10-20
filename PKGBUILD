# Maintainer: robertfoster
pkgname=megabasterd-bin
_name=MegaBasterd
pkgver=8.0
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

sha256sums=('273dd81d567438b61ddf2462e64eac1705ed17fcd49fcb30c97ea999963070f8'
            '72c7a1db49c5e58a6e6400a445758f7779a594789705dfeac954171d457af103'
            'a85b49dab7f58ab3c3b3e609a1c3c8e0fab2bedf5597a179aae82773681e7753')

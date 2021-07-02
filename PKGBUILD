# Maintainer: robertfoster

pkgname=megabasterd-bin
pkgver=7.42
pkgrel=1
pkgdesc="Yet another (unofficial) cross-platform MEGA downloader/uploader/streaming suite"
arch=('any')
url="https://github.com/tonikelope/megabasterd"
license=('GPL3')
depends=('java-runtime')
source=("https://github.com/tonikelope/megabasterd/releases/download/v${pkgver}/MegaBasterd_${pkgver}.jar"
  "${pkgname%%-bin}.sh"
  "${pkgname%%-bin}.desktop"
)

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir/usr/share/java/${pkgname%%-bin}"
  cp "MegaBasterd_$pkgver.jar" "$pkgdir/usr/share/java/${pkgname%%-bin}/${pkgname%%-bin}.jar"
  install -Dm755 "${pkgname%%-bin}.sh" "$pkgdir/usr/bin/${pkgname%%-bin}"
  install -Dm644 "images/pica_roja_big.png" "$pkgdir/usr/share/pixmaps/${pkgname%%-bin}.png"
  install -Dm644 "${pkgname%%-bin}.desktop" "$pkgdir/usr/share/applications/${pkgname%%-bin}.desktop"
}

sha256sums=('3b02fb0b79c80e14664c37249ac38ea41512d695ae460b230220f2bd98f6d0dc'
            '72c7a1db49c5e58a6e6400a445758f7779a594789705dfeac954171d457af103'
            'a85b49dab7f58ab3c3b3e609a1c3c8e0fab2bedf5597a179aae82773681e7753')

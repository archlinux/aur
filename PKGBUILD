pkgname=megabasterd-jar
_name=MegaBasterd
pkgver=8.58
pkgrel=1
pkgdesc="Yet another (unofficial) cross-platform MEGA downloader/uploader/streaming suite"
arch=('any')
url="https://github.com/tonikelope/megabasterd"
license=('GPL3')
depends=('java-runtime')
provides=('megabasterd')
conflicts=('megabasterd-bin')
source=("${url}/releases/download/v${pkgver}/${_name}_${pkgver}.jar"
  "megabasterd.sh"
  "megabasterd.desktop"
)

package() {
  cd "$srcdir"
  install -Dm644 "${_name}_$pkgver.jar" \
    "$pkgdir/usr/share/java/megabasterd/megabasterd.jar"
  install -Dm755 "megabasterd.sh" \
    "$pkgdir/usr/bin/megabasterd"
  install -Dm644 "images/pica_roja_big.png" \
    "$pkgdir/usr/share/pixmaps/megabasterd.png"
  install -Dm644 "megabasterd.desktop" \
    "$pkgdir/usr/share/applications/megabasterd.desktop"
}

sha256sums=('199b333f91dc55698110da04bd6574245a3f757d6191f87bccbf9f51b208c4a0'
            '72c7a1db49c5e58a6e6400a445758f7779a594789705dfeac954171d457af103'
            'a85b49dab7f58ab3c3b3e609a1c3c8e0fab2bedf5597a179aae82773681e7753')

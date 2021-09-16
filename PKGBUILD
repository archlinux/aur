# Maintainer: Justus Tartz <aur at jrtberlin dot de>
pkgname=beataroni-bin
pkgver=1.2.1
pkgrel=1
_archivename="Beataroni-linux64-${pkgver}"
pkgdesc="A graphical Beat Saber mod installer for Linux"
arch=('x86_64')
url="https://github.com/geefr/beatsaber-linux-goodies"
license=('BSD')
depends=('ttf-ms-fonts')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("$url/releases/download/$pkgver/${_archivename}.tar.gz"
        "beataroni.desktop"
	"beataroni.png")
sha256sums=('8eae352080b93b6e4b6ec55705bfe62aff3749ceef78f820ae04f94b6a9afd9b'
            'SKIP'
            'SKIP')
options=("!strip")

package() {
  install -Dm755 "Beataroni" -t "$pkgdir/opt/${pkgname}"
  install -Dm755 "libHarfBuzzSharp.so" -t "$pkgdir/opt/${pkgname}"
  install -Dm755 "libSkiaSharp.so" -t "$pkgdir/opt/${pkgname}"
  install -Dm644 "Beataroni.pdb" -t "$pkgdir/opt/${pkgname}"
  install -Dm644 "IPA-Minimal.pdb" -t "$pkgdir/opt/${pkgname}"

  install -Dm644 "beataroni.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 "beataroni.png" "$pkgdir/usr/share/pixmaps/beataroni.png"
}

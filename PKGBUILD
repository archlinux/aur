# Maintainer: Justus Tartz <aur at jrtberlin dot de>
pkgname=beataroni-bin
pkgver=1.2.2
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
sha256sums=('4d1a81ae320b6f4aec902a659e8b4fd994e540228508b3c2915cb613c0221075'
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

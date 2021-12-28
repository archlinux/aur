# Maintainer: Justus Tartz <aur at jrtberlin dot de>
pkgname=beataroni-bin
pkgver=1.3.0
pkgrel=2
_archivename="Beataroni-linux64-${pkgver}"
pkgdesc="A graphical Beat Saber mod installer for Linux"
arch=('x86_64')
url="https://github.com/geefr/beatsaber-linux-goodies"
license=('BSD')
depends=('ttf-ms-fonts')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("$url/releases/download/1.3/${_archivename}.tar.gz"
        "beataroni.desktop"
	"beataroni.png")
sha256sums=('7b34a68f50c82674910aee2b641bae162e669debb97db3aefcc83d05459ff9eb'
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

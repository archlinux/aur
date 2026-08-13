pkgname=topoglyph-bin
pkgver=0.3.5
pkgrel=1
pkgdesc="Topology-to-glyph text-art rendering engine (Pre-compiled)"
arch=('x86_64' 'aarch64')
url="https://github.com/Xuepoo/topoglyph"
license=('MIT')
depends=('ffmpeg')
provides=('topoglyph')
conflicts=('topoglyph')

source=("LICENSE-$pkgver::https://raw.githubusercontent.com/Xuepoo/topoglyph/v$pkgver/LICENSE")
source_x86_64=("https://github.com/Xuepoo/topoglyph/releases/download/v$pkgver/topoglyph-linux-x86_64")
source_aarch64=("https://github.com/Xuepoo/topoglyph/releases/download/v$pkgver/topoglyph-linux-aarch64")

sha256sums=('b611f7feb097dac1235bc2901046f36ff85e753b075b741412b6a0447ab20390')
sha256sums_x86_64=('8e1a89745dd21b70786b2ede6b1ae4de54e7de9c0d46d489110670af74407226')
sha256sums_aarch64=('76f8b249a25873257e827442f3d9abe1384d71f2a92df11a4a04cba973a8aa82')

package() {
  install -Dm755 "$srcdir/topoglyph-linux-$CARCH" "$pkgdir/usr/bin/topoglyph"
  install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

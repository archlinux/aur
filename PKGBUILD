pkgname=topoglyph-bin
pkgver=0.4.0
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
sha256sums_x86_64=('853cbb43863d7ac9709b1cd15f9cd69239b28398c581f55cf62bd02f9983536d')
sha256sums_aarch64=('3054ec1add2f04b2c96818bddab59b15b6327f2d2410deabf5d0848720573661')

package() {
  install -Dm755 "$srcdir/topoglyph-linux-$CARCH" "$pkgdir/usr/bin/topoglyph"
  install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

pkgname=topoglyph-bin
pkgver=0.2.1
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
sha256sums_x86_64=('87d90132a9dc76f7b923446dc9ae65b5659fe0e79957346be5e4ccb18f2512b3')
sha256sums_aarch64=('13f3ed9701af969a83f7f0c96f661109a74f8c00c0d8dbe3e297f0cb5d6c27c1')

package() {
  install -Dm755 "$srcdir/topoglyph-linux-$CARCH" "$pkgdir/usr/bin/topoglyph"
  install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

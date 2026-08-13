pkgname=topoglyph-bin
pkgver=0.3.4
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
sha256sums_x86_64=('e8b0516bb55aff8a6a0e7b7a9984402ad24a17466eba7a1cea65eb25778c7209')
sha256sums_aarch64=('11603acca8f1356e066abc5e085cd2d0cb2e1da170319df5b8592364277af9f7')

package() {
  install -Dm755 "$srcdir/topoglyph-linux-$CARCH" "$pkgdir/usr/bin/topoglyph"
  install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

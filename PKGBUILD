pkgname=topoglyph-bin
pkgver=0.3.6
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
sha256sums_x86_64=('462ad586fa26a294e78d20552c54cb2ac0c107dc194560d772c4bd18678a3bed')
sha256sums_aarch64=('ce911444de38a11f1e5c6716dac145b846ae1bacd8202e5f720fc2adb410b721')

package() {
  install -Dm755 "$srcdir/topoglyph-linux-$CARCH" "$pkgdir/usr/bin/topoglyph"
  install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

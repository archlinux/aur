pkgname=vectomancy-bin
pkgver=6.4.0
pkgrel=1
pkgdesc="Image-to-Equation Converter CLI (Pre-compiled)"
arch=('x86_64' 'aarch64')
url="https://github.com/Xuepoo/vectomancy"
license=('MIT')
depends=('gcc-libs' 'vulkan-icd-loader')
provides=('vectomancy')
conflicts=('vectomancy')

source=("LICENSE-$pkgver::https://raw.githubusercontent.com/Xuepoo/vectomancy/v$pkgver/LICENSE")
source_x86_64=("https://github.com/Xuepoo/vectomancy/releases/download/v$pkgver/vectomancy-linux-x86_64")
source_aarch64=("https://github.com/Xuepoo/vectomancy/releases/download/v$pkgver/vectomancy-linux-aarch64")

sha256sums=('b611f7feb097dac1235bc2901046f36ff85e753b075b741412b6a0447ab20390')
sha256sums_x86_64=('c562faf07567bce37451496645e57c1e797700ca538b82c1274cf58d511c7d4d')
sha256sums_aarch64=('db00bfbc1d0607ec22df026637ce93d4f62634c8098d35033f1eb061047765a6')

package() {
  install -Dm755 "$srcdir/vectomancy-linux-$CARCH" "$pkgdir/usr/bin/vectomancy"
  install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

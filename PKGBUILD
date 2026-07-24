pkgname=vectomancy-bin
pkgver=7.0.0
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
sha256sums_x86_64=('f71cf1e8ee9fc0ef4c26b2d98d5e76f65e775de32e344fa1be5931024465f0a9')
sha256sums_aarch64=('57261e948f5fa2eb7a372ed0938ddda62d10b4c61e6fd7dee279f7e97ce67828')

package() {
  install -Dm755 "$srcdir/vectomancy-linux-$CARCH" "$pkgdir/usr/bin/vectomancy"
  install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

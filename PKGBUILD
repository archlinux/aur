pkgname=vectomancy-bin
pkgver=6.3.1
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
sha256sums_x86_64=('2da1488da1b3029a31367f5e27f2f40dab207894f51268b50cb1a22e79ab20bb')
sha256sums_aarch64=('96159756a0c9a2d9ec67247e3d2bed76c79c6c1aec781c8e87d46f625cfcffa4')

package() {
  install -Dm755 "$srcdir/vectomancy-linux-$CARCH" "$pkgdir/usr/bin/vectomancy"
  install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

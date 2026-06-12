pkgname=vectomancy-bin
pkgver=5.0.14
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
sha256sums_x86_64=('5a7d01c0d4357e1be2b976471d409dd47e6c2cf911c2fe49c2a48a1fd33e8822')
sha256sums_aarch64=('40b34686e7f5949345b26baa40ad08ac8125020735f9788a713a44c8179f7a00')

package() {
  install -Dm755 "$srcdir/vectomancy-linux-$CARCH" "$pkgdir/usr/bin/vectomancy"
  install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

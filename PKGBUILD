# Maintainer: ChrisK <keanug at hotmail dot co dot uk>

pkgname=xremap-cosmic-bin
pkgver=0.15.11
pkgrel=1
pkgdesc='Dynamic key remapper for X11 and Wayland (COSMIC Wayland build)'
arch=('x86_64')
url='https://github.com/xremap/xremap'
license=('MIT')
provides=("xremap=${pkgver}")
conflicts=('xremap')
options=('!debug')
source=(
  "xremap-LICENSE-${pkgver}::https://raw.githubusercontent.com/xremap/xremap/v${pkgver}/LICENSE"
)
sha256sums=('60365594c733128ba50f05de00c4a6f07fed0a6e8bbd93817f39ded3980f7343')
sha256sums_x86_64=('ff9f9836dc2ff111105b2c28695e97234e2827f233a8f74f35587f2fcfae3bc5')
source_x86_64=(
  "xremap-${pkgver}-linux-x86_64-cosmic.zip::https://github.com/xremap/xremap/releases/download/v${pkgver}/xremap-linux-x86_64-cosmic.zip"
)
optdepends=(
  'cosmic-comp: application-specific remapping on COSMIC Wayland'
)

package() {
    install -Dm755 "$srcdir/xremap" "$pkgdir/usr/bin/xremap"
    install -Dm644 "$srcdir/xremap-LICENSE-${pkgver}" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer: Mohammadreza Khani

pkgname=dicto-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="Minimal native dictionary app for MDX/MDD files"
arch=('x86_64')
url="https://github.com/logi-camp/dicto"
license=('AGPL-3.0-or-later')
depends=(
  'gtk3'
  'alsa-lib'
  'libxkbcommon'
  'xdotool'
  'hicolor-icon-theme'
)
optdepends=(
  'vulkan-driver: GPU rendering'
  'vulkan-intel: Intel GPU support'
)
provides=('dicto')
conflicts=('dicto')
source_x86_64=("https://github.com/logi-camp/dicto/releases/download/v${pkgver}/dicto-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
b2sums_x86_64=('SKIP')

package() {
  install -Dm755 "$srcdir/dicto" \
    "$pkgdir/usr/bin/dicto"

  install -Dm644 "$srcdir/dicto.desktop" \
    "$pkgdir/usr/share/applications/dicto.desktop"

  install -Dm644 "$srcdir/icon.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/dicto.svg"

  install -Dm644 "$srcdir/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer: Mohammadreza Khani
# This PKGBUILD is updated by CI on tagged releases (see packaging/arch/publish-aur.sh).
# Hand-edits are fine but will be overwritten on the next tagged release.

pkgname=dicto-bin
pkgver=0.6.2
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
# Checksum is injected by CI from the built release tarball (real b2sum, not SKIP).
b2sums_x86_64=('14a7f751ad21b24912c617d37642391ecfdaa9c087ef4e158e71c1c50fcbaf262a438c6883a4a22d3e3aab7422198a06c7939f16b979c675cb64a81db4e31433')

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

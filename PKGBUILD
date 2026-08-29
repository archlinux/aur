# Maintainer: mafuzyk
pkgname=kernel-panic-bin
pkgver=2.5.0
pkgrel=1
pkgdesc='Neon arena shooter about keeping one stubborn process alive'
arch=('x86_64')
url='https://github.com/mafuzyk/kernel-panic'
license=('MIT')
depends=('alsa-lib' 'dbus' 'fontconfig' 'freetype2' 'glib2' 'glibc'
         'libglvnd' 'libpulse' 'libx11' 'libxcursor' 'libxi' 'libxinerama'
         'libxrandr' 'wayland' 'zlib')
provides=('kernel-panic')
conflicts=('kernel-panic' 'kernel-panic-git')
source=(
  'kernel-panic.desktop'
  "LICENSE::https://raw.githubusercontent.com/mafuzyk/kernel-panic/v${pkgver}/LICENSE"
  "launcher.png::https://raw.githubusercontent.com/mafuzyk/kernel-panic/v${pkgver}/assets/icons/launcher.png"
)
source_x86_64=(
  "kernel-panic::https://github.com/mafuzyk/kernel-panic/releases/download/v${pkgver}/kernel-panic"
)
sha256sums=(
  '875d7800fe64c91ec37899b006cf60ab3cced695e1afead37432858fa715ac74'
  'd67bb27e5e9d56eca34c95bb64989448c45fb70c06d8a6b5af4aef13c7d62618'
  '9db0dc350bc3f32748d3fc9c167b342c0f6d0c3c879b7c8023afb4289f2e46c1'
)
sha256sums_x86_64=('e99956311cf50c727c9385d8d486b80df56ba4994dedcba95f18c21081b07922')

package() {
  install -Dm755 "$srcdir/kernel-panic" "$pkgdir/usr/bin/kernel-panic"
  install -Dm644 "$srcdir/kernel-panic.desktop" \
    "$pkgdir/usr/share/applications/kernel-panic.desktop"
  install -Dm644 "$srcdir/launcher.png" \
    "$pkgdir/usr/share/icons/hicolor/192x192/apps/kernel-panic.png"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

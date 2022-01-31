# Maintainer: w1nst0n <w1nst0n at keemail dot me>
pkgname=universal-android-debloater-bin
pkgver=0.4.1
pkgrel=1
pkgdesc="Cross-platform GUI written in Rust using ADB to debloat non-rooted Android devices."
arch=('x86_64')
url="https://github.com/0x192/universal-android-debloater"
license=('GPL3')
depends=('android-tools' 'fontconfig' 'vulkan-icd-loader')
provides=('universal-android-debloater-bin')
conflicts=('universal-android-debloater-opengl-bin')
source=("$url/releases/download/$pkgver/uad_gui-linux.tar.gz"
        "uad_gui.desktop"
        "uad_gui-linux.tar.gz.sig")
sha256sums=('6b1f93859671296efac2f1c3d95cb0aa3b5be0b3218398dcea1beada0f3ec92b'
            'e55f259fab5e09d6e91412dbfa74859f609615606422b0e3c937cc774eaedbf3'
            'SKIP')
validpgpkeys=('09FD287B96B572E0802279D813639119486820A1')  # w1nst0n <w1nst0n at keemail dot me>

prepare() {
  mv target/release/uad_gui-linux uad_gui
}

package() {
  install -Dm755 uad_gui -t "$pkgdir/usr/bin"
  install -Dm644 "$srcdir/uad_gui.desktop" -t "$pkgdir/usr/share/applications"
}
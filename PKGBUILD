# Maintainer: w1nst0n <w1nst0n at keemail dot me>
pkgname=universal-android-debloater-opengl-bin
pkgver=0.5.1
pkgrel=1
pkgdesc="Cross-platform GUI written in Rust using ADB to debloat non-rooted Android devices. This version uses an OpenGL renderer for better compatibility with older hardware."
arch=('x86_64')
url="https://github.com/0x192/universal-android-debloater"
license=('GPL3')
depends=('android-tools' 'fontconfig')
provides=('universal-android-debloater')
conflicts=('universal-android-debloater')
source=("$url/releases/download/$pkgver/uad_gui-noselfupdate-linux-opengl.tar.gz"
        "uad_gui.desktop"
        "uad_gui-noselfupdate-linux-opengl.tar.gz.sig")
sha256sums=('dbac387dc02166aee79240d451368fc729ba90b0d25e541ed1400e366cd4d7e5'
            'e55f259fab5e09d6e91412dbfa74859f609615606422b0e3c937cc774eaedbf3'
            'SKIP')
validpgpkeys=('09FD287B96B572E0802279D813639119486820A1')  # w1nst0n <w1nst0n at keemail dot me>

prepare() {
  mv uad_gui-noselfupdate-linux-opengl uad_gui
}

package() {
  install -Dm755 uad_gui -t "$pkgdir/usr/bin"
  install -Dm644 "$srcdir/uad_gui.desktop" -t "$pkgdir/usr/share/applications"
}
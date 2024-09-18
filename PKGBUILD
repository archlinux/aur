# Maintainer: Frigyes <frigyes06 at proton dot me>
pkgname=universal-android-debloater-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="Cross-platform GUI written in Rust using ADB to debloat non-rooted Android devices."
arch=('x86_64')
url="https://github.com/Universal-Debloater-Alliance/universal-android-debloater-next-generation"
license=('GPL3')
depends=('android-tools' 'fontconfig' 'vulkan-icd-loader')
provides=('universal-android-debloater')
conflicts=('universal-android-debloater')
source=("$url/releases/download/v$pkgver/uad-ng-noselfupdate-linux.tar.gz"
        "uad_gui.desktop")
sha256sums=('ba315387d251be0f969bd8a26b6cd7584eef4083a9e5b9e9761732ce28bda477'
            'f56cc6dd5fba16f1309dc6c0c67252fcbcefbddc15a11c11a4f80d361758ac06')

prepare() {
  mv uad-ng-noselfupdate-linux uad-ng
}

package() {
  install -Dm755 uad-ng -t "$pkgdir/usr/bin"
  install -Dm644 "$srcdir/uad_gui.desktop" -t "$pkgdir/usr/share/applications"
}
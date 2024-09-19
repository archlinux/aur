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
        "uad-ng.desktop"
        "$(echo "$url" | sed 's|https://github.com/|https://raw.githubusercontent.com/|')/main/resources/assets/logo-dark.png")
sha256sums=('ba315387d251be0f969bd8a26b6cd7584eef4083a9e5b9e9761732ce28bda477'
            '95a2d196427cb2428b0aa913b98925f64f11c5d6d12a1df1f7f02b9448352cc5'
            '019c4df893dca5b54557c381881d7946b7a53ebf5b610cc04d61c2980c1a22ec')

prepare() {
  mv uad-ng-noselfupdate-linux uad-ng
}

package() {
  install -Dm755 uad-ng -t "$pkgdir/usr/bin"
  install -Dm644 "$srcdir/logo-dark.png" "$pkgdir/usr/share/pixmaps/uad-ng.png"
  install -Dm644 "$srcdir/uad-ng.desktop" -t "$pkgdir/usr/share/applications"
}

# Maintainer: faceless33
pkgname=cranamp-bin
pkgver=0.1.93
pkgrel=1
pkgdesc='Music player in Rust with WSZ skins and an agent-connected Skin Studio'
arch=('x86_64')
url='https://github.com/samoylenkodmitry/cranamp'
license=('Apache-2.0')
options=('!strip' '!debug')
depends=('alsa-lib' 'libgcc' 'glibc' 'hicolor-icon-theme' 'libx11' 'libxi' 'libxkbcommon-x11' 'wayland' 'vulkan-icd-loader')
optdepends=('vulkan-driver: GPU rendering' 'xdg-desktop-portal: file dialogs')
provides=("cranamp=$pkgver")
conflicts=('cranamp')
source=("https://github.com/samoylenkodmitry/cranamp/releases/download/v$pkgver/cranamp-$pkgver-linux-$CARCH-store.tar.gz")
sha256sums=('7ca62fa21a843c34b9f953c51320fd6222cc26f5199d55c41869016347f772be')
package() {
  cp -a "$srcdir/usr" "$pkgdir/"
  mv "$pkgdir/usr/share/licenses/cranamp" "$pkgdir/usr/share/licenses/$pkgname"
}

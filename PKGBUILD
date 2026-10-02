# Maintainer: faceless33
pkgname=cranamp-bin
pkgver=0.1.86
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
sha256sums=('c9941f2e869a7731f855347f990707902548a2381070e7c7751d98fc7127892a')

package() {
  cp -a "$srcdir/usr" "$pkgdir/"
  mv "$pkgdir/usr/share/licenses/cranamp" "$pkgdir/usr/share/licenses/$pkgname"
}

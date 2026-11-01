# Maintainer: mafuzyk <mafuzyk@gmail.com>

pkgname=koral-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="A Rust terminal with native sharky shell support"
arch=('x86_64')
url="https://github.com/mafuzyk/koral"
license=('GPL-3.0-only')
depends=('gcc-libs' 'glibc' 'hicolor-icon-theme' 'libxkbcommon' 'ttf-iosevkaterm-nerd' 'vulkan-icd-loader' 'wayland')
optdepends=('libnotify: desktop notifications from programs'
            'sharky-shell-git: folds, prompt jumps and command status'
            'xdg-utils: open links')
provides=('koral')
conflicts=('koral')
options=('!debug')
source=("koral-$pkgver.tar.gz::$url/releases/download/v$pkgver/koral-x86_64-linux.tar.gz")
sha256sums=('66cd48fe2dc8d3c95d8ab91e03e3d09f8c7b40a7a05d0f86f0a16d9246568902')

package() {
  install -Dm755 koral "$pkgdir/usr/bin/koral"
  install -Dm644 koral.desktop "$pkgdir/usr/share/applications/koral.desktop"
  install -Dm644 koral.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/koral.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

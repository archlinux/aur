# Maintainer: mafuzyk <mafuzyk@gmail.com>

pkgname=koral-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="A Rust terminal with native sharky shell support"
arch=('x86_64')
url="https://github.com/mafuzyk/koral"
license=('GPL-3.0-only')
depends=('gcc-libs' 'glibc' 'hicolor-icon-theme' 'libxkbcommon' 'ttf-iosevkaterm-nerd' 'vulkan-icd-loader' 'wayland')
optdepends=('sharky-shell-git: folds, prompt jumps and command status')
provides=('koral')
conflicts=('koral')
options=('!debug')
source=("koral-$pkgver.tar.gz::$url/releases/download/v$pkgver/koral-x86_64-linux.tar.gz")
sha256sums=('2b0414c3cb31b860bb5ca21405afaeccd57ced75b76a5bb3d7f9fe18e6b89b2f')

package() {
  install -Dm755 koral "$pkgdir/usr/bin/koral"
  install -Dm644 koral.desktop "$pkgdir/usr/share/applications/koral.desktop"
  install -Dm644 koral.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/koral.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

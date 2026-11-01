# Maintainer: mafuzyk <mafuzyk@gmail.com>

pkgname=koral-bin
pkgver=1.0.1
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
sha256sums=('1e76e07b9dd05ed6ddb02afccf2c7567988b2c5af5fe011359555565ae40a1a8')

package() {
  install -Dm755 koral "$pkgdir/usr/bin/koral"
  install -Dm644 koral.desktop "$pkgdir/usr/share/applications/koral.desktop"
  install -Dm644 koral.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/koral.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

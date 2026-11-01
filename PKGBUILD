# Maintainer: mafuzyk <mafuzyk@gmail.com>

pkgname=koral-bin
pkgver=1.0.2
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
sha256sums=('bf1c126ac5fa5c39ee9fa7f6532e2008ddb11ff139df2511c6048fcc2345b266')

package() {
  install -Dm755 koral "$pkgdir/usr/bin/koral"
  install -Dm644 koral.desktop "$pkgdir/usr/share/applications/koral.desktop"
  install -Dm644 koral.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/koral.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

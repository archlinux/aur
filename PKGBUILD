# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=scopebuddy
pkgver=1.5.1
pkgrel=1
pkgdesc="Manager script to make Gamescope easier to use on desktop"
arch=('any')
url="https://github.com/OpenGamingCollective/ScopeBuddy"
license=('Apache-2.0')
depends=(
  'awk'
  'bash'
  'gamescope'
  'jq'
  'perl'
  'xorg-xwayland'
)
optdepends=(
  'kdialog: Error dialog on Plasma'
  'libkscreen: Display detection via kscreen-doctor on Plasma'
  'libnotify: Last resort fallback error dialog'
  'wlr-randr: Display detection with wlroots compositors'
  'xorg-xmessage: Fallback error dialog for basic X11 systems'
  'zenity: Error dialog on GTK-based systems'
)
source=("ScopeBuddy-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('48614879ffe0f4a412e17ad5b7ba2e2c3c7cbbe56bfab36353b652886c645676')

package() {
  cd "ScopeBuddy-$pkgver"
  install -Dm755 "bin/$pkgname" -t "$pkgdir/usr/bin/"
  ln -s "/usr/bin/$pkgname" "$pkgdir/usr/bin/scb"
}

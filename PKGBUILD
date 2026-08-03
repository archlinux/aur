# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=scopebuddy
pkgver=1.5.0
pkgrel=1
pkgdesc="Manager script to make Gamescope easier to use on desktop"
arch=('any')
url="https://github.com/OpenGamingCollective/ScopeBuddy"
license=('Apache-2.0')
depends=(
  'bash'
  'gamescope'
  'jq'
  'perl'
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
sha256sums=('151eaaee947aa3cdcd0cc8bc02269b127efee4be3cbcf8cbc395efb7678bee7b')

package() {
  cd "ScopeBuddy-$pkgver"
  install -Dm755 "bin/$pkgname" -t "$pkgdir/usr/bin/"
  ln -s "/usr/bin/$pkgname" "$pkgdir/usr/bin/scb"
}

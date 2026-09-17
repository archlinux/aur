# Maintainer: rafaeloledo <rafaeloliveiraledo@gmail.com>

pkgname=auto-subs-bin
pkgver=3.9.0
pkgrel=1
pkgdesc="On-device subtitle generation for DaVinci Resolve, Premiere, and After Effects"
arch=('x86_64')
url="https://github.com/tmoroney/auto-subs"
license=('MIT')
options=('!debug')
depends=(
  'ffmpeg'
  'gtk3'
  'webkit2gtk-4.1'
)
optdepends=(
  'davinci-resolve: Fusion script integration'
)
source=("https://github.com/tmoroney/auto-subs/releases/download/v${pkgver}/AutoSubs-linux-x86_64.deb")
sha256sums=('773481bf992fdb8521981727ea54fce0e39ce6ad9d3eccae9bbeaa6f479e0430')

package() {
  cd "$srcdir"
  bsdtar -xf AutoSubs-linux-x86_64.deb
  bsdtar -xf data.tar.* -C "$pkgdir"
}

# Maintainer: rafaeloledo <rafaeloliveiraledo@gmail.com>

pkgname=auto-subs-bin
pkgver=3.11.0
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
sha256sums=('372135c9169f36af23f67588f841d447a35d1f354c5fdc915ba818d9a867d9f4')

package() {
  cd "$srcdir"
  bsdtar -xf AutoSubs-linux-x86_64.deb
  bsdtar -xf data.tar.* -C "$pkgdir"
}

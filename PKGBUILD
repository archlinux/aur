# Maintainer: rafaeloledo <rafaeloliveiraledo@gmail.com>

pkgname=auto-subs-bin
pkgver=3.10.1
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
sha256sums=('77c3cd34646b4800319e60d532abbf0c0159644f6e3c398c61e84531763ab3fe')

package() {
  cd "$srcdir"
  bsdtar -xf AutoSubs-linux-x86_64.deb
  bsdtar -xf data.tar.* -C "$pkgdir"
}

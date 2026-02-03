# Maintainer: Grey-007 <https://github.com/Grey-007>

pkgname=nolio-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Minimal calendar-based todo app built with Flutter (prebuilt binary)"
arch=('x86_64')
url="https://github.com/Grey-007/nolio"
license=('MIT')

options=(!debug)

depends=(
  'gtk3'
  'libepoxy'
  'libxkbcommon'
  'libglvnd'
  'mesa'
)

provides=('nolio')
conflicts=('nolio')

source=(
  "https://github.com/Grey-007/nolio/releases/download/v$pkgver/nolio-$pkgver-linux-x86_64.tar.gz"
)

sha256sums=('116a2313e1bfd428648690b693679f71be131f0e63bf62cd9e3231e1fdcf495a')

package() {
  install -d "$pkgdir/usr/lib/nolio"
  cp -r nolio/* "$pkgdir/usr/lib/nolio/"

  install -d "$pkgdir/usr/bin"
  ln -s /usr/lib/nolio/nolio "$pkgdir/usr/bin/nolio"
}

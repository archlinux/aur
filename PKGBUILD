# Maintainer: Khorne <khorne@khorne.me>
# Adapted from durdraw-git by: Kyle Keen <keenerd@gmail.com>
pkgname=durdraw
pkgver=0.11.1
pkgrel=2
pkgdesc="Frame based ASCII and ANSI drawing and playback program"
url="http://cmang.org/durdraw/"
license=("custom")
arch=('any')
depends=('python')
optdepends=('ansilove: png export, animated gif export'
            'python-pillow: animated gif export'
            'images2gif: animated gif export')
source=("durdraw.tar.gz::https://github.com/cmang/durdraw/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('42f8b072efec1778743233a164edb8c3')

package() {
  cd ${pkgname}-${pkgver}
  install -Dm755 durdraw "$pkgdir/usr/bin/durdraw"

  install -d "$pkgdir/usr/share/durdraw"
  install -m644 *.dur "$pkgdir/usr/share/durdraw/"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 extras/vga.pcf "$pkgdir/usr/share/fonts/X11/misc/vga.pcf"
  install -Dm644 extras/dos437.ttf "$pkgdir/usr/share/fonts/TTF/dos437.ttf"
}


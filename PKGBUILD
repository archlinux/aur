# Maintainer: Khorne <khorne@khorne.me>
# Adapted from durdraw-git by: Kyle Keen <keenerd@gmail.com>
pkgname=durdraw
pkgver=0.18.4
pkgrel=1
pkgdesc="Frame based ASCII and ANSI drawing and playback program"
url="http://cmang.org/durdraw/"
license=("custom")
arch=('any')
depends=('python' 'python-pillow')
optdepends=('ansilove: png export, animated gif export')
source=("durdraw.tar.gz::https://github.com/cmang/durdraw/archive/refs/tags/${pkgver}.tar.gz")
md5sums=('10a1749afd710438c84b5575de6e80c1')

package() {
  cd ${pkgname}-${pkgver}
  install -Dm755 durdraw "$pkgdir/usr/bin/durdraw"

  install -d "$pkgdir/usr/share/durdraw"
  install -m644 *.dur "$pkgdir/usr/share/durdraw/"
  install -d "$pkgdir/usr/share/durdraw/examples"
  install -m644 examples/*.dur "$pkgdir/usr/share/durdraw/examples/"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 extras/vga.pcf "$pkgdir/usr/share/fonts/X11/misc/vga.pcf"
  install -Dm644 extras/dos437.ttf "$pkgdir/usr/share/fonts/TTF/dos437.ttf"
}


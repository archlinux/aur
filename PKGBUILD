# Maintainer: LittleWatter <zs987526341@gmail.com>

pkgname=surge-xt-bin
pkgver=1.3.4
pkgrel=1

pkgdesc="Hybrid synthesizer and effects processor (prebuilt binary)"
arch=('x86_64')
url="https://surge-synthesizer.github.io/"
license=('GPL-3.0-or-later')

provides=('surge-xt')
conflicts=('surge-xt')

options=('!debug')

depends=(
  'alsa-lib'
  'brotli'
  'bzip2'
  'freetype2'
  'glibc'
  'hicolor-icon-theme'
  'libpng'
  'zlib'
)

source=(
  "surge-xt-linux-${CARCH}-${pkgver}.tar.gz::https://github.com/surge-synthesizer/releases-xt/releases/download/${pkgver}/surge-xt-linux-${CARCH}-${pkgver}.tar.gz"
)

sha256sums=('fdd578eea384f5ec1b40cd26936b213dc75438a18a787b21227f941d2a680ecd')

package() {
  cd "$srcdir"

  install -d "$pkgdir/usr"

  cp -a bin "$pkgdir/usr/"
  cp -a lib "$pkgdir/usr/"
  cp -a share "$pkgdir/usr/"

  ln -s "Surge XT" \
    "$pkgdir/usr/bin/surge-xt"

  ln -s "Surge XT Effects" \
    "$pkgdir/usr/bin/surge-xt-effects"
}

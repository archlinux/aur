# Maintainer: Johan Brandhorst <johan.brandhorst at gmail dot com>
pkgname=tinygo-bin
pkgver=0.41.1
pkgrel=1
epoch=
pkgdesc='TinyGo - Go for small spaces'
arch=('x86_64')
url='https://tinygo.org'
license=('BSD-3-Clause AND Apache-2.0 WITH LLVM-exception')
depends=('go>=1.23.0')
optdepends=('avr-gcc: Arduino Uno support'
            'avrdude: Arduino Uno support'
            'openocd: BBC Micro:bit support'
            'arm-none-eabi-gdb: tinygo gdb support'
)
provides=('tinygo')
conflicts=('tinygo')
source=("https://github.com/tinygo-org/tinygo/releases/download/v${pkgver}/tinygo${pkgver}.linux-amd64.tar.gz"
        "https://raw.githubusercontent.com/tinygo-org/tinygo/v${pkgver}/LICENSE"
)
sha256sums=('e156d1d93a376eef639a4143d13be07e8c463fb6cf2d7d447698ed4474d23e91'
            '4cb7d99a97ebd57584ea8398898c4b0bbbcb39662330712b43153efdad308766')

package() {
  install -d "${pkgdir}/usr/lib" "${pkgdir}/usr/bin"
  cp -r tinygo "${pkgdir}/usr/lib/"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"

  ln -sf /usr/lib/tinygo/bin/tinygo "${pkgdir}/usr/bin/tinygo"
}

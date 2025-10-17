# Maintainer: Johan Brandhorst <johan.brandhorst at gmail dot com>
pkgname=tinygo-bin
pkgver=0.39.0
pkgrel=1
epoch=
pkgdesc='TinyGo - Go for small spaces'
arch=('x86_64')
url='https://tinygo.org'
license=('custom: BSD 3-clause')
depends=('gcc-libs'
         'go>=1.11.0'
)
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
sha256sums=('a119801579ef0a7a4f3ee285f0caf55241eaa9e115154c2028b696770b47a846'
            'b51264cf951607cde87bd388b953264d0fa9b75d1f4f96ac828b29ebbb57294e')

package() {
  install -d "${pkgdir}/usr/lib" "${pkgdir}/usr/bin"
  cp -r tinygo "${pkgdir}/usr/lib/"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"

  ln -sf /usr/lib/tinygo/bin/tinygo "${pkgdir}/usr/bin/tinygo"
}

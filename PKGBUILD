# Maintainer: Ased Mammad <mammad.ased@gmail.com>
# Contributor: Evan Buss <evan.buss28@gmail.com>

pkgname=openbooks-bin
binaryname=openbooks
pkgver=4.2.0
pkgrel=1
# license=('Apache')
pkgdesc="Openbooks allows you to download ebooks from irc.irchighway.net quickly and easily."
depends=()
makedepends=()
provides=('openbooks')
arch=('aarch64' 'x86_64')
url="https://github.com/evan-buss/openbooks"
source_aarch64=(
  "$binaryname::https://github.com/evan-buss/openbooks/releases/download/v$pkgver/openbooks_linux_arm"
  "https://raw.githubusercontent.com/evan-buss/openbooks/master/README.md"
)
source_x86_64=(
  "$binaryname::https://github.com/evan-buss/openbooks/releases/download/v$pkgver/openbooks_linux"
  "https://raw.githubusercontent.com/evan-buss/openbooks/master/README.md"
)

sha256sums_aarch64=('b4ff6fe2036c04fbe8a394929a278b6e683ba89f7094cc88c5b14f6f0c50e18b'
                    'ef5364358d24f7104d053825ecc92deeeb0b60692745036fec9f5eff3f9a65cb')
sha256sums_x86_64=('51d1e0bba4539498ef81a062e93013ab3298c114d93a1de8aa08f4abf3b94b47'
                   'ef5364358d24f7104d053825ecc92deeeb0b60692745036fec9f5eff3f9a65cb')

package() {
  install -Dm755 -t "${pkgdir}/usr/bin" \
      ./openbooks
  install -Dm644 ./README.md \
      "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

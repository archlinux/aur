# Maintainer: Ased Mammad <mammad.ased@gmail.com>
# Contributor: Evan Buss <evan.buss28@gmail.com>

pkgname=openbooks-bin
binaryname=openbooks
pkgver=4.1.0
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

sha256sums_aarch64=('1755db0cf3640aecfb3b9d6467292405f8de6889cc4fa3fecb43acbb3bdab87f'
                    'ef5364358d24f7104d053825ecc92deeeb0b60692745036fec9f5eff3f9a65cb')
sha256sums_x86_64=('1755db0cf3640aecfb3b9d6467292405f8de6889cc4fa3fecb43acbb3bdab87f'
                   'ef5364358d24f7104d053825ecc92deeeb0b60692745036fec9f5eff3f9a65cb')

package() {
  install -Dm755 -t "${pkgdir}/usr/bin" \
      ./openbooks
  install -Dm644 ./README.md \
      "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

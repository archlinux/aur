# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=ttrpg-convert-cli-bin
pkgver=3.3.9
pkgrel=1
pkgdesc="Convert 5etools and pf2etools JSON data you own into Obsidian Markdown"
arch=('x86_64')
url="https://github.com/ebullient/ttrpg-convert-cli"
license=('Apache-2.0')
depends=('glibc' 'zlib')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/ttrpg-convert-cli-${pkgver}-linux-x86_64.zip")
sha256sums_x86_64=('91299041f41c8f987bd0b771883f58fe54131dec770bf5d0c73f33ea7c907529')

package() {
  install -Dm755 "ttrpg-convert-cli-${pkgver}-linux-x86_64/bin/ttrpg-convert" "${pkgdir}/usr/bin/ttrpg-convert"
  install -Dm644 "ttrpg-convert-cli-${pkgver}-linux-x86_64/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "ttrpg-convert-cli-${pkgver}-linux-x86_64/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

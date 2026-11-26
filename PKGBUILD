# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=sipexer-bin
pkgver=2.1.0
pkgrel=1
pkgdesc="Flexible SIP and VoIP command-line tool"
arch=('x86_64' 'aarch64')
url="https://github.com/miconda/sipexer"
license=('GPL-3.0-only')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/sipexer-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/sipexer-v${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('42ba5155a16c2070f3a73a9145fadc8df07f7c355cf69312b39fa0a5b220663f')
sha256sums_aarch64=('155458148da518b4ff00ba47d70f472b564921420d8a7f3a38a441fbb9ed0acd')

package() {
  install -Dm755 "sipexer" "${pkgdir}/usr/bin/sipexer"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

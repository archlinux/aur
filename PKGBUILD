# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=instatic-bin
pkgver=0.0.24
pkgrel=1
pkgdesc="The open-source alternative to Webflow, Framer and WordPress"
arch=('x86_64')
url="https://github.com/CoreBunch/Instatic"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/instatic-server-${pkgver}-linux-x64.tar.gz")
sha256sums_x86_64=('9e95397f5478b4531192cb485be9934c7d4fea07c80e174292dde25c8079eaba')

package() {
  install -Dm755 "instatic-server-${pkgver}-linux-x64/instatic-server" "${pkgdir}/usr/bin/instatic-server"
  install -Dm644 "instatic-server-${pkgver}-linux-x64/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

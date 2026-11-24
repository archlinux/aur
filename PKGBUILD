# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=autoshade-bin
pkgver=1.18.5
pkgrel=1
pkgdesc="AI-assisted RAW photo developer"
arch=('x86_64')
url="https://github.com/skymanbp/autoshade"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/AutoShade-${pkgver}-linux-x64.zip")
sha256sums_x86_64=('5ca35b82ae55a284056e03596cdf70ec149bfc90449d2f566e12d1b0f664494f')

package() {
  install -Dm755 "AutoShade-${pkgver}-linux-x64/autoshade" "${pkgdir}/usr/bin/autoshade"
  install -Dm644 "AutoShade-${pkgver}-linux-x64/python/_moge/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "AutoShade-${pkgver}-linux-x64/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "AutoShade-${pkgver}-linux-x64/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

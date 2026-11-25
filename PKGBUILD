# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=dezoomify-bin
pkgver=26.11.25
pkgrel=1
pkgdesc="Download full-resolution images from zoomable image viewers"
arch=('x86_64')
url="https://github.com/dezoomify/dezoomify"
license=('GPL-3.0-only')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/dezoomify-cli-v${pkgver}-linux-x86_64.tar.gz")
sha256sums_x86_64=('fe849deaba5ec1db5fc65dacba981f7458b1ba16439c6c1b5f3b9b324d470b48')

package() {
  install -Dm755 "dezoomify-cli" "${pkgdir}/usr/bin/dezoomify-cli"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

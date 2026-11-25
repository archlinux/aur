# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=tproxy-bin
pkgver=0.9.2
pkgrel=1
pkgdesc="A cli tool to proxy and analyze TCP connections"
arch=('x86_64' 'aarch64')
url="https://github.com/kevwan/tproxy"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/kevwan/tproxy/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/tproxy-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/tproxy-v${pkgver}-linux-arm64.tar.gz")
sha256sums=('54234cce94fcd7dbc33849756dcb5516311e0385b464cd9efc9cd3ae4a4b55f6')
sha256sums_x86_64=('115b0c7eda6928b65262acf5a820014443f0e4272790296d353d31be6de7f6a4')
sha256sums_aarch64=('fad03e3558a4ea518f0c1ad885ca9525fd9005470fbb15e4b75e2cfd18fa9de0')

package() {
  install -Dm755 "tproxy" "${pkgdir}/usr/bin/tproxy"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "readme.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

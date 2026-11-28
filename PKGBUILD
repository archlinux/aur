# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=dns-proxy-server-bin
pkgver=5.9.0
pkgrel=1
pkgdesc="Resolve DNS from Docker containers, local config, then the internet"
arch=('x86_64' 'aarch64')
url="https://github.com/mageddo/dns-proxy-server"
license=('Apache-2.0')
depends=('glibc' 'zlib')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/mageddo/dns-proxy-server/${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tgz::${_dl}/dns-proxy-server-linux-amd64-${pkgver}.tgz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tgz::${_dl}/dns-proxy-server-linux-aarch64-${pkgver}.tgz")
sha256sums=('b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1')
sha256sums_x86_64=('c73616c14532b8e61603dbce6b314e50a5ecfd9463cf81ea4ef454a42c7976b1')
sha256sums_aarch64=('ef292ebecbb5d9dd976a70ca1f61bfbfa09519c1f7fceafb759c1e20cf9f062a')

package() {
  install -Dm755 "./dns-proxy-server" "${pkgdir}/usr/bin/dns-proxy-server"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

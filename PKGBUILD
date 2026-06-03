# Maintainer: Guru <anjanaya@gmail.com>
pkgname=pgrok-bin
pkgver=1.7.0
pkgrel=1
pkgdesc="Poor man's ngrok - a multi-tenant HTTP/TCP reverse tunnel client through SSH remote port forwarding"
arch=('x86_64' 'aarch64')
url="https://github.com/pgrok/pgrok"
license=('MIT')
provides=('pgrok')
conflicts=('pgrok')
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/pgrok/pgrok/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/pgrok/pgrok/releases/download/v${pkgver}/pgrok_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/pgrok/pgrok/releases/download/v${pkgver}/pgrok_${pkgver}_linux_arm64.tar.gz")
sha256sums=('58797630db0e53446750f65c0c1479e0758451012bc78bd16f8ed683dc64719d')
sha256sums_x86_64=('d6ac1d4559d36058dd36ea9538bf057d828b7054e2e6da871d819a689633796a')
sha256sums_aarch64=('39fa5bdb923711b7060290fed5808c3a362b4860e011142fe832fa79175e4cc0')

package() {
    install -Dm755 "${srcdir}/pgrok" "${pkgdir}/usr/bin/pgrok"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

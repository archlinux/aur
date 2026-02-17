# Maintainer: Guru <anjanaya@gmail.com>
pkgname=pgrok-bin
pkgver=1.5.0
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
sha256sums_x86_64=('47f274990e5a31fbca01ea7fe7569353201ef41a6c7cfade24e6671fe72a4e9b')
sha256sums_aarch64=('990b625959b86d67dcca6b11608035f7702e8a83b5fbe2d8710cd932ef167742')

package() {
    install -Dm755 "${srcdir}/pgrok" "${pkgdir}/usr/bin/pgrok"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

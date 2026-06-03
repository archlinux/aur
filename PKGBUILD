# Maintainer: Guru <anjanaya@gmail.com>
pkgname=pgrokd-bin
pkgver=1.7.0
pkgrel=1
pkgdesc="Poor man's ngrok - a multi-tenant HTTP/TCP reverse tunnel server through SSH remote port forwarding"
arch=('x86_64' 'aarch64')
url="https://github.com/pgrok/pgrok"
license=('MIT')
provides=('pgrokd')
conflicts=('pgrokd')
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/pgrok/pgrok/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/pgrok/pgrok/releases/download/v${pkgver}/pgrokd_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/pgrok/pgrok/releases/download/v${pkgver}/pgrokd_${pkgver}_linux_arm64.tar.gz")
sha256sums=('58797630db0e53446750f65c0c1479e0758451012bc78bd16f8ed683dc64719d')
sha256sums_x86_64=('d9005f4c3418cd3992a6c47a2a5a8f94b95aad803b1b59f15170d33cb6ae1cba')
sha256sums_aarch64=('90ab6042f6fcb6aa4ed32148be8480b809046d11983b643452e9d008fb1cd2c9')

package() {
    install -Dm755 "${srcdir}/pgrokd" "${pkgdir}/usr/bin/pgrokd"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

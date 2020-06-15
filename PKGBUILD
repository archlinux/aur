# Maintainer: Felix Golatofski <contact@xdfr.de>Nils Czernia <nils@czserver.de>

pkgname=prometheus-push-gateway-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="Prometheus push acceptor for ephemeral and batch jobs "
arch=("x86_64" "arm" "armv6h" "armv7h" "aarch64")
url="https://github.com/prometheus/pushgateway"
license=("Apache")
makedepends=()
source=("prometheus-push-gateway.service")
source_x86_64=("https://github.com/prometheus/pushgateway/releases/download/v${pkgver}/pushgateway-${pkgver}.linux-amd64.tar.gz")
source_arm=("https://github.com/prometheus/pushgateway/releases/download/v${pkgver}/pushgateway-${pkgver}.linux-armv5.tar.gz")
source_armv6h=("https://github.com/prometheus/pushgateway/releases/download/v${pkgver}/pushgateway-${pkgver}.linux-armv6.tar.gz")
source_armv7h=("https://github.com/prometheus/pushgateway/releases/download/v${pkgver}/pushgateway-${pkgver}.linux-armv7.tar.gz")
source_aarch64=("https://github.com/prometheus/pushgateway/releases/download/v${pkgver}/pushgateway-${pkgver}.linux-arm64.tar.gz")
sha256sums=('fe0ec9b3f18f2f35177fdf8dd8bd5ef0cee3189b65051b4239ad2ba1f5e9961c')
sha256sums_x86_64=('fb64bc01078ff4af1b4677f29363209845188010ed25cef3cef9ede9646d548e')
sha256sums_arm=('002bb8c6d1e0d016ff0528c7fe660d2d1d7e7b2a6c111379d2ab76d4b676c057')
sha256sums_armv6h=('cfe4441396f56ac724024eda4e34e365e180fc029b6ea2aaa49f35d3d474c60f')
sha256sums_armv7h=('91cb568915665b35ee4931874ed1939f6b6af70349770462d3b015d7028bf089')
sha256sums_aarch64=('2cae5c029273c649a8cf1580a3a05e39da8a1e06569a172768d8278bce405d92')


package() {
    case "$CARCH" in
        "x86_64") ARCH="amd64";;
        "arm") ARCH="armv5";;
        "armv6h") ARCH="armv6";;
        "armv7h") ARCH="armv7";;
        "aarch64") ARCH="arm64";;
    esac

    install -Dm755 "${srcdir}/pushgateway-${pkgver}.linux-${ARCH}/pushgateway" "${pkgdir}/usr/bin/prometheus-push-gateway"
    install -Dm755 "${srcdir}/prometheus-push-gateway.service" "${pkgdir}/usr/lib/systemd/system/prometheus-push-gateway.service"
}

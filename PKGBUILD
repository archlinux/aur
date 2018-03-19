# Maintainer: Nils Czernia <nils@czserver.de>

pkgname=prometheus-push-gateway-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Prometheus push acceptor for ephemeral and batch jobs "
arch=('x86_64')
url="https://github.com/prometheus/pushgateway"
license=('Apache')
makedepends=()
source=("https://github.com/prometheus/pushgateway/releases/download/v${pkgver}/pushgateway-${pkgver}.linux-amd64.tar.gz"
        "prometheus-push-gateway.service")
sha256sums=('e1ce58b3f2c44816e748278434d6fc91e530da77dcc34b1246e1a0f25314831f'
            'fe0ec9b3f18f2f35177fdf8dd8bd5ef0cee3189b65051b4239ad2ba1f5e9961c')

package() {
    install -Dm755 "${srcdir}/pushgateway-${pkgver}.linux-amd64/pushgateway" "${pkgdir}/usr/bin/prometheus-push-gateway"
    install -Dm755 "${srcdir}/prometheus-push-gateway.service" "${pkgdir}/usr/lib/systemd/system/prometheus-push-gateway.service"
}

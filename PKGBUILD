# Maintainer: Tom Vincent <https://tlvince.com/contact>
pkgname=prometheus-json-exporter-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="A prometheus exporter which scrapes remote JSON by JSONPath"
arch=('x86_64' 'armv5h' 'armv6h' 'armv7h')
url="https://github.com/prometheus/json_exporter"
license=('Apache')
depends=()
makedepends=()
source_x86_64=("https://github.com/prometheus-community/json_exporter/releases/download/v${pkgver}/json_exporter-${pkgver}.linux-amd64.tar.gz")
source_armv5h=("https://github.com/prometheus-community/json_exporter/releases/download/v${pkgver}/json_exporter-${pkgver}.linux-armv5.tar.gz")
source_armv6h=("https://github.com/prometheus-community/json_exporter/releases/download/v${pkgver}/json_exporter-${pkgver}.linux-armv6.tar.gz")
source_armv7h=("https://github.com/prometheus-community/json_exporter/releases/download/v${pkgver}/json_exporter-${pkgver}.linux-armv7.tar.gz")

package() {
  case "$CARCH" in
    'x86_64') ARCH='amd64';;
    'armv5h') ARCH='armv5';;
    'armv6h') ARCH='armv6';;
    'armv7h') ARCH='armv7';;
  esac

  cd "${srcdir}/json_exporter-${pkgver}.linux-${ARCH}"

  # Install Binary
  install -D -m0755 json_exporter "${pkgdir}/usr/bin/prometheus_json_exporter"
}

md5sums_x86_64=('120f7a1d6cf2354fdfb8bd38c5e62351')
md5sums_armv5h=('fe5b31bd7479d2791765a6aaee918578')
md5sums_armv6h=('60b80210574a594c89d45be8e96c67ac')
md5sums_armv7h=('33a74dae35acfe504562a0ddda7d56fc')

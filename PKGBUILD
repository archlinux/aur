# Maintainer: Tom Vincent <https://tlvince.com/contact>
pkgname=prometheus-json-exporter-bin
pkgver=0.7.0 # renovate: datasource=github-tags depName=prometheus-community/json_exporter
pkgrel=1
pkgdesc="A prometheus exporter which scrapes remote JSON by JSONPath"
arch=('x86_64' 'armv5h' 'armv6h' 'armv7h')
url="https://github.com/prometheus-community/json_exporter"
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

md5sums_x86_64=('f85c139f2fc8c08cb8588fef37140d8d')
md5sums_armv5h=('22b3d30fb0d459b970b376a86fd15055')
md5sums_armv6h=('830d402263d947e2062b88c86fa718e2')
md5sums_armv7h=('c48bfc4046c0c8780536a88077fd08d7')

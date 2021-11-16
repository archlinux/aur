# Maintainer: Tom Vincent <https://tlvince.com/contact>
pkgname=prometheus-json-exporter-bin
pkgver=0.3.0
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

md5sums_x86_64=('4c42dfd933a26240797ccfa6b68f0d9c')
md5sums_armv5h=('a63314c628e7fc41bfabc87a7d51f124')
md5sums_armv6h=('168af7af374942d8f2431ae5191d1df5')
md5sums_armv7h=('6775a26771de1e3138d49ef5cf9cc8ec')

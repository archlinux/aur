# Maintainer: Hashim-K <Hashim-K@users.noreply.github.com>

pkgname=usagestat-bin
pkgver=2.0.2
pkgrel=1
pkgdesc="Scriptable CLI for local agent usage data"
arch=("x86_64")
url="https://github.com/hashimkarim/usagestat"
license=("MIT")
depends=("glibc")
provides=("usagestat")
conflicts=("usagestat")
source_x86_64=("usagestat-${pkgver}-linux-x86_64.tar.gz::${url}/releases/download/v${pkgver}/usagestat-linux-x86_64.tar.gz")
sha256sums_x86_64=("0b7b2de373bca09f50465384e59f49faf8a84606e975341008fa0be7db8bef88")

package() {
  install -Dm755 "${srcdir}/usagestat" "${pkgdir}/usr/bin/usagestat"
  if [[ -f "${srcdir}/usagestatd" ]]; then
    install -Dm755 "${srcdir}/usagestatd" "${pkgdir}/usr/bin/usagestatd"
  fi
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  mkdir -p "${pkgdir}/usr/share/usagestat"
  cp -a "${srcdir}/plugins" "${pkgdir}/usr/share/usagestat/"
}

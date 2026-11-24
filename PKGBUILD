# Maintainer: Hashim-K <Hashim-K@users.noreply.github.com>

pkgname=usagestat-bin
pkgver=2.4.1
pkgrel=1
pkgdesc="Scriptable CLI for local agent usage data"
arch=("x86_64")
url="https://github.com/hashimkarim/usagestat"
license=("MIT")
depends=("glibc")
provides=("usagestat")
conflicts=("usagestat")
source_x86_64=("usagestat-${pkgver}-linux-x86_64.tar.gz::${url}/releases/download/v${pkgver}/usagestat-linux-x86_64.tar.gz")
sha256sums_x86_64=("5f77cce77309b3c1ee23f8a5e05321a6e5f4d2083e05475d4bff0bf4721058f7")

package() {
  install -Dm755 "${srcdir}/usagestat" "${pkgdir}/usr/bin/usagestat"
  if [[ -f "${srcdir}/usagestatd" ]]; then
    install -Dm755 "${srcdir}/usagestatd" "${pkgdir}/usr/bin/usagestatd"
  fi
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  mkdir -p "${pkgdir}/usr/share/usagestat"
  cp -a "${srcdir}/plugins" "${pkgdir}/usr/share/usagestat/"
}

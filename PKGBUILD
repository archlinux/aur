# Maintainer: Hashim-K <Hashim-K@users.noreply.github.com>

pkgname=usagestat-bin
pkgver=1.0.3
pkgrel=1
pkgdesc="Scriptable CLI for local agent usage data"
arch=("x86_64")
url="https://github.com/Hashim-K/usagestat"
license=("MIT")
depends=("glibc")
provides=("usagestat")
conflicts=("usagestat")
source_x86_64=("usagestat-${pkgver}-linux-x86_64.tar.gz::${url}/releases/download/v${pkgver}/usagestat-linux-x86_64.tar.gz")
sha256sums_x86_64=("ea74ddbad5a4b1aefc3612947c6e2c4506cd25c452ee245ee4b5fe7a1bb5a4b5")

package() {
  install -Dm755 "${srcdir}/usagestat" "${pkgdir}/usr/bin/usagestat"
  if [[ -f "${srcdir}/usagestatd" ]]; then
    install -Dm755 "${srcdir}/usagestatd" "${pkgdir}/usr/bin/usagestatd"
  fi
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  mkdir -p "${pkgdir}/usr/share/usagestat"
  cp -a "${srcdir}/plugins" "${pkgdir}/usr/share/usagestat/"
}

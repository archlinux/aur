# Maintainer: Daniel Fernández Rodríguez <gmail.com daferoes>
pkgname=kauthproxy
pkgver=1.2.3
pkgrel=1
pkgdesc="Local authentication proxy for Kubernetes Dashboard"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/int128/kauthproxy"
license=('Apache')
depends=('kubectl' 'glibc')
source=()
sha256sums=()

case "$CARCH" in
  x86_64) _pkgarch="amd64"
    sha256sums+=('b3b11590ad97c60fd1d7ea3c31aa487d3069b8bb81ee15819f52c93bef515ae9')
    ;;
  arm*) _pkgarch="arm"
    sha256sums+=('8c9526b2f59ecb7c03cf69c30c57ddce35e5e456d80348bef465e9b9f373fa10')
    ;;
  aarch64) _pkgarch="arm64"
    sha256sums+=('eedc364c54a0c7c60f0619db52412449dab729d9b7ce2684db3c9e8e7be44ffe')
    ;;
esac

source+=(${pkgname}-${pkgver}-${_pkgarch}.zip::"https://github.com/int128/kauthproxy/releases/download/v${pkgver}/kauthproxy_linux_${_pkgarch}.zip")

package() {
    install ${srcdir}/kauthproxy -Dm755 "${pkgdir}/usr/bin/kauthproxy"
    install ${srcdir}/kauthproxy -Dm755 "${pkgdir}/usr/bin/kubectl-auth_proxy"
}

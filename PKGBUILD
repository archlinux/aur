# Maintainer: Daniel Fernández Rodríguez <gmail.com daferoes>
pkgname=kauthproxy
pkgver=1.2.1
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
    sha256sums+=('8199aad0e90d626bf37886558e2a13ae8b13ec280d47c7d52957addf2ce0c283')
    ;;
  arm*) _pkgarch="arm"
    sha256sums+=('90b8b6fabc3e19863b33a30f2d8e8ce037890faab3208ac236072a1a3d4eea0a')
    ;;
  aarch64) _pkgarch="arm64"
    sha256sums+=('4b66e50e503e105126d0563c12ba45be687ddc5c48cfc2ff50c7c4fe0fcfbf19')
    ;;
esac

source+=(${pkgname}-${pkgver}-${_pkgarch}.zip::"https://github.com/int128/kauthproxy/releases/download/v${pkgver}/kauthproxy_linux_${_pkgarch}.zip")

package() {
    install ${srcdir}/kauthproxy -Dm755 "${pkgdir}/usr/bin/kauthproxy"
    install ${srcdir}/kauthproxy -Dm755 "${pkgdir}/usr/bin/kubectl-auth_proxy"
}

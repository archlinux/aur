# Maintainer: miaoermua <miaoermua@gmail.com>

pkgname=fnpack-bin
pkgver=1.2.1
pkgrel=1
pkgdesc="飞牛 fnOS 应用打包工具"
arch=('x86_64' 'aarch64')
url="https://developer.fnnas.com/docs/cli/fnpack"
license=('MIT')
provides=('fnpack')
conflicts=('fnpack')
options=(!debug)

case "$CARCH" in
  x86_64)
    _arch=amd64
    source=("https://static2.fnnas.com/fnpack/fnpack-${pkgver}-linux-amd64")
    sha256sums=('72d2a4095da676b64510b023731a227b369d80f8079bc45ff8a2f802ec0480c1')
    ;;
  aarch64)
    _arch=arm64
    source=("https://static2.fnnas.com/fnpack/fnpack-${pkgver}-linux-arm64")
    sha256sums=('aad9e16b101267d30017f39ab969e3c085fbce209716f8bd3b1e167eaf15e0cf')
    ;;
  *)
    error "Unsupported architecture: $CARCH"
    exit 1
    ;;
esac

package() {
  install -Dm755 "${srcdir}/fnpack-${pkgver}-linux-${_arch}" "${pkgdir}/usr/bin/fnpack"
}
# Maintainer: miaoermua <miaoermua@gmail.com>

pkgname=fnpack-bin
pkgver=1.2.0
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
    sha256sums=('523227c950a589ab3af327cf91c45511154265487bf723b29da9cfa2e0dc9d5a')
    ;;
  aarch64)
    _arch=arm64
    source=("https://static2.fnnas.com/fnpack/fnpack-${pkgver}-linux-arm64")
    sha256sums=('33a76a7c685832b8de1adff3a6362c384bf367988d819e98bcf85569bb219d30')
    ;;
  *)
    error "Unsupported architecture: $CARCH"
    exit 1
    ;;
esac

package() {
  install -Dm755 "${srcdir}/fnpack-${pkgver}-linux-${_arch}" "${pkgdir}/usr/bin/fnpack"
}
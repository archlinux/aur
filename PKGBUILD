# Maintainer: Tang Yu <hi@tangyu.me>

pkgname=dify-plugin-daemon-bin
_pkgname=dify-plugin-daemon
pkgver=0.4.1
pkgrel=1
pkgdesc="Dify Plugin Daemon CLI and daemon (prebuilt binary for Linux amd64)"
arch=('x86_64')
url="https://github.com/langgenius/dify-plugin-daemon"
license=('Apache-2.0')
depends=('glibc')  # go 二进制通常只需要 glibc
provides=("dify")
conflicts=('dify-plugin-daemon')

source=("dify-plugin-linux-amd64::https://github.com/langgenius/${_pkgname}/releases/download/${pkgver}/dify-plugin-linux-amd64")

# 发布到 AUR 时建议把 SKIP 换成真实 sha256，先 SKIP 方便你调试
sha256sums=('5d0e6684ad460c45e8e28b4a84b316c586c3a0fe2edbe1cd5b25a16d8494940b')

package() {
  install -Dm755 "${srcdir}/dify-plugin-linux-amd64" "${pkgdir}/usr/bin/dify-plugin-daemon"
}

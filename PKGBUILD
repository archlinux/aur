# Maintainer: CCE-Li <2766503189@qq.com>
# PKGBUILD for Quick-SSH (Arch Linux)
# Rust 原生二进制版本 - 无需 Node.js 依赖
#
# Quick-SSH 使用 Rust 编译为原生二进制，无运行时依赖。
#
# 更新步骤:
#   1. 更新 pkgver 到新版本号
#   2. 从 GitHub Release 的 SHA256SUMS 中获取 qssh-x86_64-linux.tar.gz 的哈希值
#   3. 运行: makepkg --printsrcinfo > .SRCINFO
#   4. git commit && git push

pkgname=quick-ssh
pkgver=2.0.2
pkgrel=1
pkgdesc="🚀 Quick-SSH - Docker-style SSH connection manager with TUI (Rust native binary)"
arch=('x86_64')
url="https://github.com/CCE-Li/Quick-SSH"
license=('MIT')
depends=('glibc' 'openssh')
provides=('quick-ssh')
conflicts=('quick-ssh')
source=("$url/releases/download/v$pkgver/qssh-x86_64-linux.tar.gz")
sha256sums=('4794d11f18a96101d1e50eb55ccb7518435a9d0d9afa32a1ce250e5ef6aef488')
# 注: 发布前请从 Release 的 SHA256SUMS 中获取真实哈希值替换 SKIP

package() {
  tar xzf "$srcdir/qssh-x86_64-linux.tar.gz" -C "$srcdir"
  install -dm755 "$pkgdir/usr/bin"
  install -m755 "$srcdir/qssh-x86_64-linux/qssh" "$pkgdir/usr/bin/qssh"
  install -m755 "$srcdir/qssh-x86_64-linux/qssh-uploader" "$pkgdir/usr/bin/qssh-uploader"
}


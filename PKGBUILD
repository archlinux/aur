# Maintainer: sinbud2004 <sinbud2004@gmail.com>
pkgname=ssh_tunnel_egui
pkgver=0.1.0
pkgrel=1
pkgdesc="一个基于egui的SSH SOCKS5图形界面程序，使用sshpass和ssh连接远程代理服务器"
arch=('x86_64')
url="https://aur.archlinux.org/packages/ssh_tunnel_egui"
license=('MIT')
depends=('openssh' 'sshpass')
makedepends=('rust' 'cargo')
source=("$pkgname::git+https://github.com/Paul-sinbud2004/ssh_tunnel_egui.git")
sha256sums=('SKIP')
export CARGO_TARGET_DIR="$srcdir/target"

build() {
  cd "$srcdir/$pkgname"
  CARGO_TARGET_DIR=target cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "target/release/sshgui" "$pkgdir/usr/bin/ssh_tunnel_egui"
}


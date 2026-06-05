# Maintainer: JF Turcot <jf.turcot@gmail.com>
pkgname=herd-bin
_pkgname=herd
pkgver=0.8.11
pkgrel=1
pkgdesc="GitHub-native orchestration platform for AI coding agents"
arch=('x86_64' 'aarch64')
url="https://github.com/Herd-OS/herd"
license=('Apache-2.0')
depends=('git' 'github-cli')
optdepends=('docker: self-hosted worker runner containers'
            'docker-compose: legacy docker-compose-based runner deployment')
provides=('herd')
conflicts=('herd' 'herd-git')
source_x86_64=("herd-$pkgver-x86_64::https://github.com/Herd-OS/herd/releases/download/v$pkgver/herd-linux-amd64")
source_aarch64=("herd-$pkgver-aarch64::https://github.com/Herd-OS/herd/releases/download/v$pkgver/herd-linux-arm64")
sha256sums_x86_64=('5452f3d7b7d44655052595a25ba33497a8e5b56fa0785ad42706582eea6b3f13')
sha256sums_aarch64=('00827edecd8f0ae0b5acf2ae8daab41744f7e49b27b14e042b13366495bfdc85')

package() {
  install -Dm755 "herd-$pkgver-$CARCH" "$pkgdir/usr/bin/herd"
}

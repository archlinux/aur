# Maintainer: JF Turcot <jf.turcot@gmail.com>
pkgname=herd-bin
_pkgname=herd
pkgver=0.8.7
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
sha256sums_x86_64=('2a85284af88da99b058b72677719f2ee8237e9b66dbbac206e22b8c8c4e0f6d7')
sha256sums_aarch64=('f5d9326ecf9b940fd6ed6f7d741988576c4a532d3a1ade74920947c381f553d2')

package() {
  install -Dm755 "herd-$pkgver-$CARCH" "$pkgdir/usr/bin/herd"
}

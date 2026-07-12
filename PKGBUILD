# Maintainer: JF Turcot <jf.turcot@gmail.com>
pkgname=herd-bin
_pkgname=herd
pkgver=0.8.27
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
sha256sums_x86_64=('56ea23fe974b5f3c4828eb89923c3653cd602268675896f5124bc4d8ba37bdc6')
sha256sums_aarch64=('6f94cc65ffdbf609f5935423badb37edc26819db06398f82b89a88ee22563659')

package() {
  install -Dm755 "herd-$pkgver-$CARCH" "$pkgdir/usr/bin/herd"
}

# Maintainer: JF Turcot <jf.turcot@gmail.com>
pkgname=herd-bin
_pkgname=herd
pkgver=0.8.14
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
sha256sums_x86_64=('cc8fce05d4aea68b0ce9b6b64ab9c2eeec5bbdd3a97f035838fbbf58749c8d12')
sha256sums_aarch64=('3ef81039fd243ebf49a216585fd34fde7abb3c3b5710b0ea5e37d12647bd3c7a')

package() {
  install -Dm755 "herd-$pkgver-$CARCH" "$pkgdir/usr/bin/herd"
}

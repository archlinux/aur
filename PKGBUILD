# Maintainer: JF Turcot <jf.turcot@gmail.com>
pkgname=herd-bin
_pkgname=herd
pkgver=0.8.16
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
sha256sums_x86_64=('1a78e0fbb93d0b4793d7fe0e179688702b640c2ff6ec62541f0f9a92fc8ed76b')
sha256sums_aarch64=('e0f96db7ce6d7366a4a87bb97ab786431d536a56d04818e027e040b85f7cbfbf')

package() {
  install -Dm755 "herd-$pkgver-$CARCH" "$pkgdir/usr/bin/herd"
}

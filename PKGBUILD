# Maintainer: Thomas Butler <goliyth@gmail.com>
pkgname=fnclaude-renderer-bin
pkgver=1.0.2
pkgrel=1
pkgdesc="Configurable TUI front-end for Claude Code with stream-json driving and toggleable visibility filters"
arch=('x86_64' 'aarch64')
url="https://github.com/fnrhombus/fnclaude-renderer"
license=('MIT')
provides=('fnclaude-renderer')
conflicts=('fnclaude-renderer')
optdepends=('glow: pretty markdown rendering for assistant output')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/fnrhombus/fnclaude-renderer/releases/download/v$pkgver/fnclaude-renderer_Linux_x86_64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/fnrhombus/fnclaude-renderer/releases/download/v$pkgver/fnclaude-renderer_Linux_arm64.tar.gz")
sha256sums_x86_64=('a76df3e4355f30be42eacc1b3ea8aa18c9381419c7a31313cc2d040699b2f9da')
sha256sums_aarch64=('0e3fc5223506a504402079cd6b97b765fe9b3bfead6f07896254a6cc0f741a8e')

package() {
    # release.yml's publish-aur job runs updpkgsums: true, which re-fetches
    # the source_* URLs and rewrites sha256sums_* before pushing to AUR.
    # 'SKIP' here is only the placeholder; live releases carry real sums.
    install -Dm755 fnclaude-renderer "$pkgdir/usr/bin/fnclaude-renderer"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 2>/dev/null || true
}

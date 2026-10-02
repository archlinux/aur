# Maintainer: Hikari Hayashi <rev.hikari@gmail.com>

pkgname=figma-agent-linux-bin
pkgver=0.4.4
pkgrel=1
pkgdesc="Use locally installed fonts in Figma’s web app on Linux."
url="https://github.com/neetly/figma-agent-linux"
license=(MIT)
arch=(x86_64 aarch64)
optdepends=(fontconfig)
makedepends=()
provides=(figma-agent-linux)
conflicts=(figma-agent-linux)
source=("LICENSE-$pkgver::https://raw.githubusercontent.com/neetly/figma-agent-linux/$pkgver/LICENSE"
        "figma-agent.service-$pkgver::https://raw.githubusercontent.com/neetly/figma-agent-linux/$pkgver/files/figma-agent.service"
        "figma-agent.socket-$pkgver::https://raw.githubusercontent.com/neetly/figma-agent-linux/$pkgver/files/figma-agent.socket")
source_x86_64=("figma-agent-x86_64-unknown-linux-gnu-$pkgver::https://github.com/neetly/figma-agent-linux/releases/download/$pkgver/figma-agent-x86_64-unknown-linux-gnu")
source_aarch64=("figma-agent-aarch64-unknown-linux-gnu-$pkgver::https://github.com/neetly/figma-agent-linux/releases/download/$pkgver/figma-agent-aarch64-unknown-linux-gnu")
sha256sums=('ed27b7a5adb3229f6713cd1a924bfd0195a4f70d63379ba40b6cd8041128d672'
            'a2c6732e17d3f227f08269820aec84383042db89b45f31fa800fa7f2fe122232'
            'bddc08a2e52e76f6b883a725f9aeb50363055be09115da30e101f022521b64fe')
sha256sums_x86_64=('d55e8d0a1b7cd003b0a3b4a7b8bdb5fe2f55a2417d624db4a512200788e47cc2')
sha256sums_aarch64=('026c352edeb5dc04bd2899d420c3d1a24bc6fc7b1435ed65b2ae6c5f20c96f75')
install=figma-agent.install

package() {
  install -Dm755 "./figma-agent-$CARCH-unknown-linux-gnu-$pkgver" "$pkgdir/usr/bin/figma-agent"
  install -Dm644 "./LICENSE-$pkgver" "$pkgdir/usr/share/licenses/figma-agent/LICENSE"
  install -Dm644 "./figma-agent.service-$pkgver" "$pkgdir/usr/lib/systemd/user/figma-agent.service"
  install -Dm644 "./figma-agent.socket-$pkgver" "$pkgdir/usr/lib/systemd/user/figma-agent.socket"
}

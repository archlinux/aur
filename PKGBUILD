# Maintainer: Hikari Hayashi <rev.hikari@gmail.com>

pkgname=figma-agent-linux-bin
pkgver=0.3.2
pkgrel=1
pkgdesc="Figma Agent for Linux (a.k.a. Font Helper)"
url="https://github.com/neetly/figma-agent-linux"
license=(MIT)
arch=(x86_64 aarch64)
depends=(freetype2 fontconfig)
makedepends=()
provides=(figma-agent-linux)
conflicts=(figma-agent-linux)
source=("https://github.com/neetly/figma-agent-linux/raw/$pkgver/LICENSE"
        "https://github.com/neetly/figma-agent-linux/raw/$pkgver/figma-agent.service"
	"https://github.com/neetly/figma-agent-linux/raw/$pkgver/figma-agent.socket")
source_x86_64=("https://github.com/neetly/figma-agent-linux/releases/download/$pkgver/figma-agent-x86_64-unknown-linux-gnu")
source_aarch64=("https://github.com/neetly/figma-agent-linux/releases/download/$pkgver/figma-agent-aarch64-unknown-linux-gnu")
sha256sums=('a70a5ae5187682046f073f7c6a0387970f1422f211bfab1571c498f91dd72636'
            'b65cf8a6538c9aae212e40e396377059b7d24aebb24fa9c38ada2ef74646053f'
            '28740ed93815515f9e2e7f1e71cdf25612515ecf9a78030904bffe83f7fe2e58')
sha256sums_x86_64=('9c35e0beae50ff92859157853158475e00c270f5f40d48a0ef8d97b11e83302f')
sha256sums_aarch64=('ebad304e64815a69dcfb4a9d51b29419ff3225891bfd3ef1b9a227d995afa52c')
install=figma-agent.install

package() {
  install -Dm755 "./figma-agent-$CARCH-unknown-linux-gnu" "$pkgdir/usr/bin/figma-agent"
  install -Dm644 "./LICENSE" "$pkgdir/usr/share/licenses/figma-agent/LICENSE"
  install -Dm644 "./figma-agent.service" "$pkgdir/usr/lib/systemd/user/figma-agent.service"
  install -Dm644 "./figma-agent.socket" "$pkgdir/usr/lib/systemd/user/figma-agent.socket"
}

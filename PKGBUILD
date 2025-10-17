# Maintainer: Hikari Hayashi <rev.hikari@gmail.com>

pkgname=figma-agent-linux-bin
pkgver=0.4.2
pkgrel=1
pkgdesc="Figma Agent for Linux (a.k.a. Font Helper)"
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
sha256sums_x86_64=('3839fc763f0126822931c81e76aaf5dfa42bef0c74a789728397bffc671228fd')
sha256sums_aarch64=('034a66e9a49ed0677d53dd80becea0d2e6104a57b422bdefe6da02c4ba999fa3')
install=figma-agent.install

package() {
  install -Dm755 "./figma-agent-$CARCH-unknown-linux-gnu-$pkgver" "$pkgdir/usr/bin/figma-agent"
  install -Dm644 "./LICENSE-$pkgver" "$pkgdir/usr/share/licenses/figma-agent/LICENSE"
  install -Dm644 "./figma-agent.service-$pkgver" "$pkgdir/usr/lib/systemd/user/figma-agent.service"
  install -Dm644 "./figma-agent.socket-$pkgver" "$pkgdir/usr/lib/systemd/user/figma-agent.socket"
}

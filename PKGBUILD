# Maintainer: Hikari Hayashi <rev.hikari@gmail.com>

pkgname=figma-agent-linux-bin
pkgver=0.4.3
pkgrel=1
pkgdesc="This service allows you to use your locally installed fonts on figma.com."
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
sha256sums_x86_64=('85661938e54ad5f6c4af7101d7a7375b1f0f9f132c0c517530b39eea8388656c')
sha256sums_aarch64=('351d721d42c0f17af9a188aa4c04aca216ebf01afc0af47b762b6665ad9f9a6c')
install=figma-agent.install

package() {
  install -Dm755 "./figma-agent-$CARCH-unknown-linux-gnu-$pkgver" "$pkgdir/usr/bin/figma-agent"
  install -Dm644 "./LICENSE-$pkgver" "$pkgdir/usr/share/licenses/figma-agent/LICENSE"
  install -Dm644 "./figma-agent.service-$pkgver" "$pkgdir/usr/lib/systemd/user/figma-agent.service"
  install -Dm644 "./figma-agent.socket-$pkgver" "$pkgdir/usr/lib/systemd/user/figma-agent.socket"
}

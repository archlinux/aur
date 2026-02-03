# Maintainer: Hugo Parente Lima <hugo.pl@gmail.com>

pkgname=mgccli
pkgver=0.52.0
pkgrel=2
pkgdesc="Magalu Cloud CLI"
arch=("x86_64")
url="https://github.com/MagaluCloud/mgccli"
license=("GPL3")

source=("$pkgname-$pkgver.tar.gz::https://github.com/MagaluCloud/mgccli/releases/download/v${pkgver}/mgccli_${pkgver}_linux_amd64.tar.gz")
sha256sums=('6c7bb118334eff9f1e2f37c8532efc3ee42aed36e8d4a1b34a5cf9f8c4e75fcd')

build() {
  ./mgc completion bash > mgc.bash
  ./mgc completion zsh > mgc.zsh
}

package() {
  install -Dm 0644 mgc.bash ${pkgdir}/usr/share/bash-completion/completions/mgc
  install -Dm 0644 mgc.zsh ${pkgdir}/usr/share/zsh/site-functions/_mgc
  install -Dm 0755 mgc ${pkgdir}/usr/bin/mgc
}

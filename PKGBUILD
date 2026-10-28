# Maintainer: Hugo Parente Lima <hugo.pl@gmail.com>

pkgname=mgccli
pkgver=0.67.0
pkgrel=1
pkgdesc="Magalu Cloud CLI"
arch=("x86_64")
url="https://github.com/MagaluCloud/mgccli"
license=("GPL3")

source=("$pkgname-$pkgver.tar.gz::https://github.com/MagaluCloud/mgccli/releases/download/v${pkgver}/mgccli_${pkgver}_linux_amd64.tar.gz")
sha256sums=('1cfd39f92520ce57080d2154f85f6740d6a31f646432e490582f318e44d32bc1')

build() {
  ./mgc completion bash >mgc.bash
  ./mgc completion zsh >mgc.zsh
}

package() {
  install -Dm 0644 mgc.bash ${pkgdir}/usr/share/bash-completion/completions/mgc
  install -Dm 0644 mgc.zsh ${pkgdir}/usr/share/zsh/site-functions/_mgc
  install -Dm 0755 mgc ${pkgdir}/usr/bin/mgc
}

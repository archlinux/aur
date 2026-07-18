# Maintainer: Pavel Olizko <contact@nolight.dev>

pkgname=nls-bin
pkgver=0.10.0
pkgrel=1
pkgdesc='A modern ls with useful tables'
arch=('x86_64' 'aarch64')
url='https://github.com/nolight132/nls'
license=('MIT')
provides=('nls')
conflicts=('nls')
source_x86_64=("nls-${pkgver}-linux-amd64.tar.gz::${url}/releases/download/v${pkgver}/nls_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("nls-${pkgver}-linux-arm64.tar.gz::${url}/releases/download/v${pkgver}/nls_v${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('fb7c952b54109b1fccf29e5a702e979df0399904a8bf16c06e5d29ed7386dc4e')
sha256sums_aarch64=('4908740ba17298745cb24bb6abdcfb4c109e366427c617f7bc1947d20435a0b5')

build() {
  ./nls --completion bash --completion zsh --completion fish
}

package() {
  install -Dm755 nls "${pkgdir}/usr/bin/nls"
  install -Dm644 completion.bash "${pkgdir}/usr/share/bash-completion/completions/nls"
  install -Dm644 completion.zsh "${pkgdir}/usr/share/zsh/site-functions/_nls"
  install -Dm644 completion.fish "${pkgdir}/usr/share/fish/vendor_completions.d/nls.fish"
}

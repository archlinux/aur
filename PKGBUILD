# Maintainer: José Gabriel Gruber <development at jgabrielgruber dot dev>
# Contributor: thdxr (original PKGBUILD)
# Contributor: Noel Jacob (bun-bin PKGBUILD)
pkgname=gowebly-bin
pkgver=2.0.2
pkgrel=1
pkgdesc="🔥 A next-generation CLI tool to easily build amazing web applications with Go on the backend, using htmx & hyperscript and the most popular CSS frameworks on the frontend"
arch=('x86_64')
url="https://github.com/gowebly/gowebly"
license=('Apache-2.0')
provides=('gowebly')
conflicts=('gowebly')
sha256sums_x86_64=("69165ef5ef8dc3a21d17b25e50ba811650962cc8afd748e9c231275787f08baf")
source_x86_64=("gowebly-x64-${pkgver}.tar.gz::https://github.com/gowebly/gowebly/releases/download/v${pkgver}/gowebly_${pkgver}_linux_amd64.tar.gz")
build() {
  install -dm755 "completions"
  SHELL=zsh "./gowebly" completions > "completions/gowebly.zsh"
  SHELL=bash "./gowebly" completions > "completions/gowebly.bash"
  SHELL=fish "./gowebly" completions > "completions/gowebly.fish"
}
package() {
  install -Dm755 "./gowebly" "${pkgdir}/usr/bin/gowebly"
  
  install -Dm644 completions/gowebly.zsh "${pkgdir}/usr/share/zsh/site-functions/_gowebly"
  install -Dm644 completions/gowebly.bash "${pkgdir}/usr/share/bash-completion/completions/gowebly"
  install -Dm644 completions/gowebly.fish "${pkgdir}/usr/share/fish/vendor_completions.d/gowebly.fish"
}


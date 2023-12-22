# Maintainer: José Gabriel Gruber <development at jgabrielgruber dot dev>
# Contributor: thdxr (original PKGBUILD)
# Contributor: Noel Jacob (bun-bin PKGBUILD)
pkgname=templ-bin
pkgver=0.2.501
pkgrel=1
pkgdesc="A language for writing HTML user interfaces in Go."
arch=('x86_64')
url="https://github.com/a-h/templ"
license=('MIT')
provides=('templ')
conflicts=('templ')
sha256sums_x86_64=("fb1df6cab2a139650ea25acc21dd8f02f542bf97ea2951380bcbf63c8af3cdf1")
source_x86_64=("templ-x86-x64-${pkgver}.tar.gz::https://github.com/a-h/templ/releases/download/v${pkgver}/templ_Linux_x86_64.tar.gz")
build() {
  install -dm755 "completions"
  SHELL=zsh "./templ" completions > "completions/templ.zsh"
  SHELL=bash "./templ" completions > "completions/templ.bash"
  SHELL=fish "./templ" completions > "completions/templ.fish"
}
package() {
  install -Dm755 "./templ" "${pkgdir}/usr/bin/templ"
  
  install -Dm644 completions/templ.zsh "${pkgdir}/usr/share/zsh/site-functions/_templ"
  install -Dm644 completions/templ.bash "${pkgdir}/usr/share/bash-completion/completions/templ"
  install -Dm644 completions/templ.fish "${pkgdir}/usr/share/fish/vendor_completions.d/templ.fish"
}


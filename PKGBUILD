# Maintainer: Asger Hautop Drewsen <asger@tyilo.com>
# Based on `grype-bin` PKGBUILD
pkgname='grant-bin'
pkgver=0.6.7
pkgrel=1
pkgdesc='A license scanner for container images and filesystems.'
url='https://github.com/anchore/grant'
arch=('x86_64')
license=('Apache-2.0')
source=("https://github.com/anchore/grant/releases/download/v${pkgver}/grant_${pkgver}_linux_amd64.tar.gz")
sha256sums=('66572af8d363b87f010195215d90649effa94f26a6e9ef7d181a7874a3959560')
package() {
  "$srcdir/grant" completion zsh > "$srcdir/zsh_grant"
  "$srcdir/grant" completion fish > "${srcdir}/fish_grant"
  "$srcdir/grant" completion bash > "$srcdir/bash_grant"

  install -D -m 0755 "$srcdir/grant" "${pkgdir}/usr/bin/grant"
  install -D -m 0644 "$srcdir/zsh_grant" "$pkgdir/usr/share/zsh/site-functions/_grant"
  install -D -m 0644 "${srcdir}/fish_grant" "${pkgdir}/usr/share/fish/completions/grant.fish"
  install -D -m 0644 "$srcdir/bash_grant" "$pkgdir/usr/share/bash-completion/completions/grant"
}

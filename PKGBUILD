# Maintainer: Lukas Grossar <lukas.grossar@gmail.com>

pkgname=dyff-bin
pkgver=1.5.7
pkgrel=1
pkgdesc="diff tool for YAML files"
arch=('x86_64')
url="https://github.com/homeport/dyff"
license=('MIT')
source=("https://github.com/homeport/dyff/releases/download/v${pkgver}/dyff_${pkgver}_linux_amd64.tar.gz")
sha256sums=('fe7903a9ed42debb200efcf7fb850134a8d0ba0bf3c2da6e10e374a0cf0c4a6c')

package() {
  install -Dm 755 "$srcdir/dyff" -t "$pkgdir/usr/bin"

  "$pkgdir/usr/bin/dyff" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/dyff"
  "$pkgdir/usr/bin/dyff" completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_dyff"
  "$pkgdir/usr/bin/dyff" completion fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/dyff.fish"
}

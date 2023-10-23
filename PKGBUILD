# Maintainer: Lukas Grossar <lukas.grossar@gmail.com>

pkgname=dyff-bin
pkgver=1.6.0
pkgrel=1
pkgdesc="diff tool for YAML files"
arch=('x86_64')
url="https://github.com/homeport/dyff"
license=('MIT')
source=("https://github.com/homeport/dyff/releases/download/v${pkgver}/dyff_${pkgver}_linux_amd64.tar.gz")
sha256sums=('d21879c4810f8f97af9ed637b8339a80dfa3fb089bd45cfbeea95b8639b203e1')

package() {
  install -Dm 755 "$srcdir/dyff" -t "$pkgdir/usr/bin"

  "$pkgdir/usr/bin/dyff" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/dyff"
  "$pkgdir/usr/bin/dyff" completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_dyff"
  "$pkgdir/usr/bin/dyff" completion fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/dyff.fish"
}

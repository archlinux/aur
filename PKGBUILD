# Maintainer: Lukas Grossar <lukas.grossar@gmail.com>

pkgname=dyff-bin
pkgver=1.10.3
pkgrel=1
pkgdesc="diff tool for YAML files"
arch=('x86_64')
url="https://github.com/homeport/dyff"
provides=('dyff')
license=('MIT')
source=("https://github.com/homeport/dyff/releases/download/v${pkgver}/dyff_${pkgver}_linux_amd64.tar.gz")
sha256sums=('cb189119ff95941308edd98792818eb53ee91fd26e265c0e153b9f5e416f20a1')

package() {
  install -Dm 755 "$srcdir/dyff" -t "$pkgdir/usr/bin"

  "$pkgdir/usr/bin/dyff" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/dyff"
  "$pkgdir/usr/bin/dyff" completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_dyff"
  "$pkgdir/usr/bin/dyff" completion fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/dyff.fish"

  install -Dm 644 "$srcdir/README.md" -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}

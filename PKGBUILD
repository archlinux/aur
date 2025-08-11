# Maintainer: Lukas Grossar <lukas.grossar@gmail.com>

pkgname=dyff-bin
pkgver=1.10.2
pkgrel=1
pkgdesc="diff tool for YAML files"
arch=('x86_64')
url="https://github.com/homeport/dyff"
provides=('dyff')
license=('MIT')
source=("https://github.com/homeport/dyff/releases/download/v${pkgver}/dyff_${pkgver}_linux_amd64.tar.gz")
sha256sums=('46e986b23505d8198a079b25d550deebdb767a55b73af337d8a4fe6d2b271c74')

package() {
  install -Dm 755 "$srcdir/dyff" -t "$pkgdir/usr/bin"

  "$pkgdir/usr/bin/dyff" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/dyff"
  "$pkgdir/usr/bin/dyff" completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_dyff"
  "$pkgdir/usr/bin/dyff" completion fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/dyff.fish"

  install -Dm 644 "$srcdir/README.md" -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}

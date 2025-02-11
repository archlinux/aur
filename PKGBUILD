# Maintainer: Lukas Grossar <lukas.grossar@gmail.com>

pkgname=azwi-bin
pkgver=1.4.1
pkgrel=1
pkgdesc="CLI that helps manage Entra ID Workload Identity"
arch=('x86_64')
url="https://github.com/Azure/azure-workload-identity"
license=('MIT')
source=("https://github.com/Azure/azure-workload-identity/releases/download/v${pkgver}/azwi-v${pkgver}-linux-amd64.tar.gz")
sha256sums=('1824d5c0ff700e6aff38f99812670f0dbf828407da0e977cd6c2342e40a32ee6')

package() {
  install -Dm 755 "$srcdir/azwi" -t "$pkgdir/usr/bin"

  "$pkgdir/usr/bin/azwi" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/azwi"
  "$pkgdir/usr/bin/azwi" completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_azwi"
  "$pkgdir/usr/bin/azwi" completion fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/azwi.fish"
}

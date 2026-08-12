# Maintainer: Lukas Grossar <lukas.grossar@gmail.com>

pkgname=azwi-bin
pkgver=1.6.1
pkgrel=1
pkgdesc="CLI that helps manage Entra ID Workload Identity"
arch=('x86_64')
url="https://github.com/Azure/azure-workload-identity"
license=('MIT')
source=("https://github.com/Azure/azure-workload-identity/releases/download/v${pkgver}/azwi-v${pkgver}-linux-amd64.tar.gz")
sha256sums=('f0e2fdfc71004ecee56e9a4c9f44e278acaa96a365b32c82555805f7449529c7')

package() {
  install -Dm 755 "$srcdir/azwi" -t "$pkgdir/usr/bin"

  "$pkgdir/usr/bin/azwi" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/azwi"
  "$pkgdir/usr/bin/azwi" completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_azwi"
  "$pkgdir/usr/bin/azwi" completion fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/azwi.fish"
}

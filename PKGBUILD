# Maintainer: Lukas Grossar <lukas.grossar@gmail.com>

pkgname=azwi-bin
pkgver=1.5.0
pkgrel=1
pkgdesc="CLI that helps manage Entra ID Workload Identity"
arch=('x86_64')
url="https://github.com/Azure/azure-workload-identity"
license=('MIT')
source=("https://github.com/Azure/azure-workload-identity/releases/download/v${pkgver}/azwi-v${pkgver}-linux-amd64.tar.gz")
sha256sums=('179d0252e880af6a60c033b62209f9bd51d7c1f01c9e96be80d736fd7297f3ba')

package() {
  install -Dm 755 "$srcdir/azwi" -t "$pkgdir/usr/bin"

  "$pkgdir/usr/bin/azwi" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/azwi"
  "$pkgdir/usr/bin/azwi" completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_azwi"
  "$pkgdir/usr/bin/azwi" completion fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/azwi.fish"
}

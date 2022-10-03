# Maintainer: Arturo Penen <apenen@gmail.com>

pkgname=triggermesh-bin
pkgdesc="Build your event driven applications in Kubernetes with TriggerMesh APIs. Event sources, targets, filters, splitters, functions, you can do it all."
pkgver=1.21.0
pkgrel=1
arch=('x86_64')
url="https://github.com/triggermesh/tm"
license=('apache')
conflicts=()
provides=('tm=$pkgver')
source=(https://github.com/triggermesh/tm/releases/download/v$pkgver/tm-linux-amd64)
sha256sums=('c24098aa88ae84260179845282303a294c36dd95222e93be385a94fda8900326')

package() {
  install -Dm 755 "$srcdir/tm-linux-amd64" "$pkgdir/usr/bin/tm"
  install -d 755 "$pkgdir/usr/share/bash-completion/completions"
  install -d 755 "$pkgdir/usr/share/zsh/site-functions"
  "$pkgdir/usr/bin/tm" completion bash > "$pkgdir/usr/share/bash-completion/completions/tm"
  "$pkgdir/usr/bin/tm" completion zsh >  "$pkgdir/usr/share/zsh/site-functions/_tm"
}

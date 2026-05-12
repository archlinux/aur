# Contributor: Mario Ray Mahardhika <leledumbo_cool@yahoo.co.id>
# Maintainer: tee < teeaur at duck dot com >
pkgname=k6-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="A modern load testing tool, using Go and JavaScript (precompiled)"
provides=("k6={$pkgver}")
arch=('x86_64' 'aarch64')
url='https://k6.io'
license=('AGPL-3.0-or-later')
options=(!emptydirs)
source_x86_64=("https://github.com/k6io/k6/releases/download/v${pkgver}/k6-v${pkgver}-linux-amd64.tar.gz")
sha256sums_x86_64=('2ae87d976f6cdba17185bdd980d8819a3a98e9092c6f0638cd58272ecefc8b90')

package() {
  cd "k6-v${pkgver}-linux-amd64"
  install -Dm755 k6 -t "$pkgdir/usr/bin/"
  install -Dm644 <(./k6 completion bash 2>/dev/null) "$pkgdir/usr/share/bash-completion/completions/k6"
  install -Dm644 <(./k6 completion fish 2>/dev/null) "$pkgdir/usr/share/fish/vendor_completions.d/k6.fish"
  install -Dm644 <(./k6 completion zsh  2>/dev/null) "$pkgdir/usr/share/zsh/site-functions/_k6"
}

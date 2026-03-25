# Contributor: Mario Ray Mahardhika <leledumbo_cool@yahoo.co.id>
# Maintainer: tee < teeaur at duck dot com >
pkgname=k6-bin
pkgver=1.7.0
pkgrel=1
pkgdesc="A modern load testing tool, using Go and JavaScript (precompiled)"
provides=("k6={$pkgver}")
arch=('amd64' 'x86_64' 'arm64')
url='https://k6.io'
license=('AGPL-3.0-or-later')
options=(!emptydirs)
source_x86_64=("https://github.com/k6io/k6/releases/download/v${pkgver}/k6-v${pkgver}-linux-$arch.tar.gz")
sha256sums_x86_64=('e144c99a9fe1218fb72d2c60179b74aa1c30761fb5c7381716bddfbd1bd4413e')

package() {
  cd "$srcdir/k6-v${pkgver}-linux-amd64"
  install -Dm755 k6 -t "$pkgdir/usr/bin"
  install -Dm644 <(./k6 completion bash 2>/dev/null) "$pkgdir/usr/share/bash-completion/completions/k6"
  install -Dm644 <(./k6 completion fish 2>/dev/null) "$pkgdir/usr/share/fish/vendor_completions.d/k6.fish"
  install -Dm644 <(./k6 completion zsh  2>/dev/null) "$pkgdir/usr/share/zsh/site-functions/_k6"
}
# vim:set noet sts=0 sw=4 ts=4:

# Maintainer: Simon Weald <simon[at]simonweald[dot]com>

pkgname=stern-bin
pkgdesc="Multi pod and container log tailing for Kubernetes"
pkgver=1.7.0
pkgrel=2
arch=('x86_64')
url="https://github.com/wercker/stern"
license=('apache')
_stern_file=stern_linux_amd64
source=("https://github.com/wercker/stern/releases/download/$pkgver/$_stern_file")
sha256sums=('edc2731f2fcdd03fa6716c4a16ca26a7356fb05bf27aa6eb0a1b0046a1aa56c7')

package() {
  install -Dm 755 "$srcdir/$_stern_file" "$pkgdir/usr/bin/stern"
  install -d 755 "$pkgdir/usr/share/bash-completion/completions"
  "$pkgdir/usr/bin/stern" --completion=bash > "$pkgdir/usr/share/bash-completion/completions/stern"
  install -d 755 "$pkgdir/usr/share/zsh/site-functions"
  "$pkgdir/usr/bin/stern" --completion=zsh > "$pkgdir/usr/share/zsh/site-functions/_stern"
}

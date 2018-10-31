# Maintainer: Simon Weald <simon[at]simonweald[dot]com>

pkgname=stern-bin
pkgdesc="Multi pod and container log tailing for Kubernetes"
pkgver=1.10.0
pkgrel=2
arch=('x86_64')
url="https://github.com/wercker/stern"
license=('apache')
_stern_file=stern_linux_amd64
source=("$_stern_file-$pkgver::https://github.com/wercker/stern/releases/download/$pkgver/$_stern_file")
sha256sums=('a0335b298f6a7922c35804bffb32a68508077b2f35aaef44d9eb116f36bc7eda')

package() {
  install -Dm 755 "$srcdir/$_stern_file-$pkgver" "$pkgdir/usr/bin/stern"
  "$pkgdir/usr/bin/stern" --completion=bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/stern"
  "$pkgdir/usr/bin/stern" --completion=zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_stern"
}

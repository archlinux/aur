# Maintainer: Simon Weald <simon[at]simonweald[dot]com>

pkgname=stern-bin
pkgdesc="Multi pod and container log tailing for Kubernetes"
pkgver=1.8.0
pkgrel=1
arch=('x86_64')
url="https://github.com/wercker/stern"
license=('apache')
_stern_file=stern_linux_amd64
source=("https://github.com/wercker/stern/releases/download/$pkgver/$_stern_file")
sha256sums=('091aceef4e4655c06c519f58fb05ea290bd6aae7a1cf660c62aad0c030794e65')

package() {
  install -Dm 755 "$srcdir/$_stern_file" "$pkgdir/usr/bin/stern"
  install -d 755 "$pkgdir/usr/share/bash-completion/completions"
  "$pkgdir/usr/bin/stern" --completion=bash > "$pkgdir/usr/share/bash-completion/completions/stern"
  install -d 755 "$pkgdir/usr/share/zsh/site-functions"
  "$pkgdir/usr/bin/stern" --completion=zsh > "$pkgdir/usr/share/zsh/site-functions/_stern"
}

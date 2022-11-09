# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=tetra
pkgname=$_pkgname-bin
pkgver=0.8.3
pkgrel=0
pkgdesc="eBPF-based Security Observability and Runtime Enforcement - CLI"
url="https://github.com/cilium/${_pkgname}gon"
license=('APACHE')
source=("$_pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$_pkgname-linux-amd64.tar.gz")
arch=('x86_64')
sha512sums=('7921283afc15070df96cecccf5171f218f47ac3241267bc2d564976ebe60b5cbfd997432bcbad7049af547d98f782267672872169e4c90e6f85a87d961e92ce6')
conflicts=("$_pkgname" "${_pkgname}-git")

package() {
  install -D -m 0755 $srcdir/$_pkgname $pkgdir/usr/bin/$_pkgname
  $srcdir/$_pkgname completion zsh > $srcdir/zsh_$_pkgname
  $srcdir/$_pkgname completion bash > $srcdir/bash_$_pkgname
  install -D -m 0644 $srcdir/zsh_$_pkgname $pkgdir/usr/share/zsh/site-functions/_$_pkgname
  install -D -m 0644 $srcdir/bash_$_pkgname $pkgdir/usr/share/bash-completion/completions/$_pkgname
}

#vim: syntax=sh

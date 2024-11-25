# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=pinniped
pkgname=$_pkgname-bin
pkgver=0.35.0
pkgrel=0
pkgdesc="Pinniped provides identity services for Kubernetes clusters"
url="https://github.com/vmware-tanzu/$_pkgname"
license=('APACHE')
source=("$_pkgname-$pkgver::$url/releases/download/v$pkgver/$_pkgname-cli-linux-amd64")
arch=('x86_64')
sha512sums=('4d57e84b74f357a1ad12c5cf7c85b025ae7c88e2941ffddd519f6adf6a9f181dcdd6e9f8a41889981c77d3ad5a3c9bad776b264530ae1cabce202103ee261f8b')
conflicts=("$_pkgname" "${_pkgname}-git")

package() {
  install -D -m 0755 $srcdir/$_pkgname-$pkgver $pkgdir/usr/bin/$_pkgname
  $pkgdir/usr/bin/$_pkgname completion zsh >$srcdir/zsh_$_pkgname
  $pkgdir/usr/bin/$_pkgname completion bash >$srcdir/bash_$_pkgname
  install -D -m 0644 $srcdir/zsh_$_pkgname $pkgdir/usr/share/zsh/site-functions/_$_pkgname
  install -D -m 0644 $srcdir/bash_$_pkgname $pkgdir/usr/share/bash-completion/completions/$_pkgname
}

#vim: syntax=sh

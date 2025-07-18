# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=tetra
pkgname=$_pkgname-bin
pkgver=1.4.1 # renovate: datasource=github-releases depName=cilium/tetragon
pkgrel=1
pkgdesc="eBPF-based Security Observability and Runtime Enforcement - CLI"
url="https://github.com/cilium/${_pkgname}gon"
license=('Apache-2.0')
source=("$_pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$_pkgname-linux-amd64.tar.gz")
arch=('x86_64')
sha512sums=('b46a698a6c3689be93b87ac6738a03bdeb8fcf34f8f3bcda4bbc1b4e4e3d6dd2b9bb6c5a24bba7d1b3b2443da9a8c6781c984b117f7349ff7a8e0d7962c516e9')
conflicts=("$_pkgname" "${_pkgname}-git")

package() {
  install -D -m 0755 $srcdir/$_pkgname $pkgdir/usr/bin/$_pkgname
  $srcdir/$_pkgname completion zsh > $srcdir/zsh_$_pkgname
  $srcdir/$_pkgname completion bash > $srcdir/bash_$_pkgname
  install -D -m 0644 $srcdir/zsh_$_pkgname $pkgdir/usr/share/zsh/site-functions/_$_pkgname
  install -D -m 0644 $srcdir/bash_$_pkgname $pkgdir/usr/share/bash-completion/completions/$_pkgname
}

#vim: syntax=sh

# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=tetra
pkgname=$_pkgname-bin
pkgver=1.7.1 # renovate: datasource=github-releases depName=cilium/tetragon
pkgrel=1
pkgdesc="eBPF-based Security Observability and Runtime Enforcement - CLI"
url="https://github.com/cilium/${_pkgname}gon"
license=('Apache-2.0')
source=("$_pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$_pkgname-linux-amd64.tar.gz")
arch=('x86_64')
sha512sums=('bebf607303b20151134540588edaeca45df4c3340105d4a4f395f2508d69622b9a7b9183787dfedb77219a349ea83f948291b7b88939d1e5b96e417db253f6c6')
conflicts=("$_pkgname" "${_pkgname}-git")

package() {
  install -D -m 0755 $srcdir/$_pkgname $pkgdir/usr/bin/$_pkgname
  $srcdir/$_pkgname completion zsh > $srcdir/zsh_$_pkgname
  $srcdir/$_pkgname completion bash > $srcdir/bash_$_pkgname
  install -D -m 0644 $srcdir/zsh_$_pkgname $pkgdir/usr/share/zsh/site-functions/_$_pkgname
  install -D -m 0644 $srcdir/bash_$_pkgname $pkgdir/usr/share/bash-completion/completions/$_pkgname
}

#vim: syntax=sh

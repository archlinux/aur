# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=tetra
pkgname=$_pkgname-bin
pkgver=1.8.0 # renovate: datasource=github-releases depName=cilium/tetragon
pkgrel=1
pkgdesc="eBPF-based Security Observability and Runtime Enforcement - CLI"
url="https://github.com/cilium/${_pkgname}gon"
license=('Apache-2.0')
source=("$_pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$_pkgname-linux-amd64.tar.gz")
arch=('x86_64')
sha512sums=('3db3560e02376d59c49a3a6393103a0801d53f743f376a8698723f6e7ac9888e66da1800e23b88f6fb6102ecee06e5e3e8aa9d4e9a0bf74bc16620c0cd35a82e')
conflicts=("$_pkgname" "${_pkgname}-git")

package() {
  install -D -m 0755 $srcdir/$_pkgname $pkgdir/usr/bin/$_pkgname
  $srcdir/$_pkgname completion zsh > $srcdir/zsh_$_pkgname
  $srcdir/$_pkgname completion bash > $srcdir/bash_$_pkgname
  install -D -m 0644 $srcdir/zsh_$_pkgname $pkgdir/usr/share/zsh/site-functions/_$_pkgname
  install -D -m 0644 $srcdir/bash_$_pkgname $pkgdir/usr/share/bash-completion/completions/$_pkgname
}

#vim: syntax=sh

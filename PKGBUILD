# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=tetra
pkgname=$_pkgname-bin
pkgver=1.7.0 # renovate: datasource=github-releases depName=cilium/tetragon
pkgrel=1
pkgdesc="eBPF-based Security Observability and Runtime Enforcement - CLI"
url="https://github.com/cilium/${_pkgname}gon"
license=('Apache-2.0')
source=("$_pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$_pkgname-linux-amd64.tar.gz")
arch=('x86_64')
sha512sums=('da3f4ba65cd4cec1cb8aad188ea5d8a13d9438a04c8703635c18b6e0f7871327bf866875fc68dbc8b58d711cd963e6a31ced1f3ef13af19a58ce0ca03b2e6bcf')
conflicts=("$_pkgname" "${_pkgname}-git")

package() {
  install -D -m 0755 $srcdir/$_pkgname $pkgdir/usr/bin/$_pkgname
  $srcdir/$_pkgname completion zsh > $srcdir/zsh_$_pkgname
  $srcdir/$_pkgname completion bash > $srcdir/bash_$_pkgname
  install -D -m 0644 $srcdir/zsh_$_pkgname $pkgdir/usr/share/zsh/site-functions/_$_pkgname
  install -D -m 0644 $srcdir/bash_$_pkgname $pkgdir/usr/share/bash-completion/completions/$_pkgname
}

#vim: syntax=sh

# Maintainer: Christian Cwienk <ccwienk@dr1fter.de>
# Maintainer: Gerald Morrison <gerald.gm.morrison@gmail.com>

pkgname=ocm-cli
pkgver=0.15.0
pkgrel=1
pkgdesc='Open Component Model (OCM) Command Line Client'
arch=('x86_64')
url='https://github.com/open-component-model/ocm'
license=('Apache-2.0')
source=("https://github.com/open-component-model/ocm/releases/download/v${pkgver}/ocm-${pkgver}-linux-amd64.tar.gz")
noextract=()
b2sums=('2963b7bcbdffe8b5d3d8d2fc23c8dab679460ed0bbfa65e4c47e07d00db2adbb0b17ff8d8a1129bddfc6f7f1638302a61dea76d702e5b887accee80f70542c1e')

build() {
  ocm completion bash > ocm-bash-completion
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  cp "$srcdir/ocm" "$pkgdir/usr/bin/ocm"
  mkdir -p "$pkgdir/usr/share/bash-completion/completions"
  cp "$srcdir/ocm-bash-completion" "$pkgdir/usr/share/bash-completion/completions/ocm"
}

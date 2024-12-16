# Maintainer: ocm.software <ocm@sap.com>
# Contributor: Christian Cwienk <ccwienk@dr1fter.de>
# Contributor: Gerald Morrison <gerald.gm.morrison@gmail.com>

pkgname=ocm-cli
pkgver=0.19.0
pkgrel=1
pkgdesc='Open Component Model (OCM) Command Line Client'
arch=('x86_64')
url='https://github.com/open-component-model/ocm'
license=('Apache-2.0')
source=("https://github.com/open-component-model/ocm/releases/download/v${pkgver}/ocm-${pkgver}-linux-amd64.tar.gz")
noextract=()
b2sums=('ebc798af0afca5981285efb6a33e58ee5f6eebcb25f589ccdadfa1a537ec13f3b5f3d7c3e7dd9d03154e11aad5c4ccac9610b99fa34de2b66a1d3003bd8dbf48')

build() {
  ocm completion bash > ocm-bash-completion
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  cp "$srcdir/ocm" "$pkgdir/usr/bin/ocm"
  mkdir -p "$pkgdir/usr/share/bash-completion/completions"
  cp "$srcdir/ocm-bash-completion" "$pkgdir/usr/share/bash-completion/completions/ocm"
}

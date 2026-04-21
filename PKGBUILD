# Maintainer: ocm.software <ocm@sap.com>
# Contributor: Christian Cwienk <ccwienk@dr1fter.de>
# Contributor: Gerald Morrison <gerald.gm.morrison@gmail.com>

pkgname=ocm-cli
pkgver=0.40.0
pkgrel=1
pkgdesc='Open Component Model (OCM) Command Line Client'
arch=('x86_64')
url='https://github.com/open-component-model/ocm'
license=('Apache-2.0')
source=("https://github.com/open-component-model/ocm/releases/download/v${pkgver}/ocm-${pkgver}-linux-amd64.tar.gz")
noextract=()
b2sums=('3ce291c76d5fefe3fe0915a270a54b194d179c0210029ebe1ed39173c9d163caa8105527a39f9f25379ef41d53bcf6343a6b5192e07be0fab652ec29f6e73e55')

build() {
  ocm completion bash > ocm-bash-completion
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  cp "$srcdir/ocm" "$pkgdir/usr/bin/ocm"
  mkdir -p "$pkgdir/usr/share/bash-completion/completions"
  cp "$srcdir/ocm-bash-completion" "$pkgdir/usr/share/bash-completion/completions/ocm"
}

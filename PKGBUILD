# Maintainer: Christian Cwienk <ccwienk@dr1fter.de>
# Maintainer: Gerald Morrison <gerald.gm.morrison@gmail.com>

pkgname=ocm-cli
pkgver=0.14.0
pkgrel=1
pkgdesc='Open Component Model (OCM) Command Line Client'
arch=('x86_64')
url='https://github.com/open-component-model/ocm'
license=('Apache-2.0')
source=("https://github.com/open-component-model/ocm/releases/download/v${pkgver}/ocm-${pkgver}-linux-amd64.tar.gz")
noextract=()
b2sums=('cc119cb1e07c9098a5687eb2e5b7f43c3be48179a502451e25c69967c82c003259c63cd9a04667b669b3b186b42d940d0bd7b1b39624b509d9efb81029910e3d')

build() {
  ocm completion bash > ocm-bash-completion
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  cp "$srcdir/ocm" "$pkgdir/usr/bin/ocm"
  mkdir -p "$pkgdir/usr/share/bash-completion/completions"
  cp "$srcdir/ocm-bash-completion" "$pkgdir/usr/share/bash-completion/completions/ocm"
}

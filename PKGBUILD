# Maintainer: Christian Cwienk <ccwienk@dr1fter.de>

pkgname=ocm-cli
pkgver=0.13.0
pkgrel=1
pkgdesc='Open Component Model (OCM) Command Line Client'
arch=('x86_64')
url='https://github.com/open-component-model/ocm'
license=('Apache-2.0')
source=("https://github.com/open-component-model/ocm/releases/download/v${pkgver}/ocm-${pkgver}-linux-amd64.tar.gz")
noextract=()
b2sums=('c13da1d6d67d5418c1e7aac4e708407ee038aa276927d5147a3a3e5fe2b322fda175b550860ca1cf1c27583471d2613dee6e5b30c98899e8e791f3e912ce2bf8')


build() {
  ocm completion bash > ocm-bash-completion
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  cp "$srcdir/ocm" "$pkgdir/usr/bin/ocm"
  mkdir -p "$pkgdir/usr/share/bash-completion/completions"
  cp "$srcdir/ocm-bash-completion" "$pkgdir/usr/share/bash-completion/completions/ocm"
}

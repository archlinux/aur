# Maintainer: Christian Cwienk <ccwienk@dr1fter.de>

pkgname=ocm-cli
pkgver=0.12.0
pkgrel=1
pkgdesc='Open Component Model (OCM) Command Line Client'
arch=('x86_64')
url='https://github.com/open-component-model/ocm'
license=('Apache-2.0')
source=("https://github.com/open-component-model/ocm/releases/download/v${pkgver}/ocm-${pkgver}-linux-amd64.tar.gz")
noextract=()
b2sums=('d0c30da4f93b40ce8c825b08569f89affd31156cff303bbf8326f9ab608ed049359edad4c1fa77b064b8144711dd5b97d4de479f2f41c302e979684e41a1ff0f')


build() {
  ocm completion bash > ocm-bash-completion
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  cp "$srcdir/ocm" "$pkgdir/usr/bin/ocm"
  mkdir -p "$pkgdir/usr/share/bash-completion/completions"
  cp "$srcdir/ocm-bash-completion" "$pkgdir/usr/share/bash-completion/completions/ocm"
}

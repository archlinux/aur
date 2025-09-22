# Maintainer: ocm.software <ocm@sap.com>
# Contributor: Christian Cwienk <ccwienk@dr1fter.de>
# Contributor: Gerald Morrison <gerald.gm.morrison@gmail.com>

pkgname=ocm-cli
pkgver=0.30.0
pkgrel=1
pkgdesc='Open Component Model (OCM) Command Line Client'
arch=('x86_64')
url='https://github.com/open-component-model/ocm'
license=('Apache-2.0')
source=("https://github.com/open-component-model/ocm/releases/download/v${pkgver}/ocm-${pkgver}-linux-amd64.tar.gz")
noextract=()
b2sums=('ec247b85d7302cedf298a51c2ccf52926f50d606da2e6c3b52260420b15fa039a9dd5702752eac8d655268f88a0141d0863fcea9243ef304791eab9068a08c8c')

build() {
  ocm completion bash > ocm-bash-completion
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  cp "$srcdir/ocm" "$pkgdir/usr/bin/ocm"
  mkdir -p "$pkgdir/usr/share/bash-completion/completions"
  cp "$srcdir/ocm-bash-completion" "$pkgdir/usr/share/bash-completion/completions/ocm"
}

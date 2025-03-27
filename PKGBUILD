# Maintainer: kvaps <kvapss@gmail.com>

pkgname=qbec-bin
pkgver=0.16.3
pkgrel=0
pkgdesc="Configure Kubernetes objects on multiple clusters using Jsonnet"
arch=('x86_64')
url="https://github.com/splunk/qbec"
license=('Apache')
provides=(qbec)
conflicts=(qbec)
optdepends=(
  'jsonnet-bundler-bin: jsonnet package manager'
)
source=("https://github.com/splunk/qbec/releases/download/v${pkgver}/qbec-linux-amd64.tar.gz")
sha256sums=('c7cfb73d76180e35a4268350764ee082dc326bd156111daee99d5abc5a6e15b7')

package() {
  install -Dm 755 "$srcdir/qbec" "$pkgdir/usr/bin/qbec"
  install -Dm 755 "$srcdir/jsonnet-qbec" "$pkgdir/usr/bin/jsonnet-qbec"
  "$pkgdir/usr/bin/qbec" completion | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/qbec"
}

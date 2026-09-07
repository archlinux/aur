# Maintainer: kvaps <kvapss@gmail.com>

pkgname=qbec-bin
pkgver=0.31.0
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
sha256sums=('0b4378e697ab3af6ac1a8271571854f16d72c73f2f20b3ff31911720579ea9f4')

package() {
  install -Dm 755 "$srcdir/qbec" "$pkgdir/usr/bin/qbec"
  install -Dm 755 "$srcdir/jsonnet-qbec" "$pkgdir/usr/bin/jsonnet-qbec"
  "$pkgdir/usr/bin/qbec" completion | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/qbec"
}

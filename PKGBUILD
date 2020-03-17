# Maintainer: kvaps <kvapss@gmail.com>

pkgname=qbec-bin
pkgver=0.10.5
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
sha256sums=('dc302961bb958dec0575d9f508880358a3f06565bbfcf400a109da79192d4eda')

package() {
  install -Dm 755 "$srcdir/qbec" "$pkgdir/usr/bin/qbec"
  install -Dm 755 "$srcdir/jsonnet-qbec" "$pkgdir/usr/bin/jsonnet-qbec"
  "$pkgdir/usr/bin/qbec" completion | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/qbec"
}

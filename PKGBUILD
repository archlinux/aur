# Maintainer: OramahMaalhur <oramahmaalhur@gmail.com>
# Contributor: Pieter Joost van de Sande <pj@born2code.net>
pkgname=argo
pkgver=3.4.0
pkgrel=1
pkgdesc='Workflow engine for Kubernetes'
url='https://github.com/argoproj/argo-workflows'
arch=('x86_64')
license=('Apache-2.0')
makedepends=()
depends=()
source=("${url}/releases/download/v${pkgver}/argo-linux-amd64.gz")
sha256sums=('3ded6cf4a93a6efb7b26826963c6ca47f5e45c01b45bd37f8aa118e012935789')

build() {
  cd $srcdir
  chmod +x argo-linux-amd64
}

check() {
  cd $srcdir
  ./argo-linux-amd64 version
}

package() {
  cd $srcdir/
  install -Dm755 argo-linux-amd64 "$pkgdir"/usr/bin/$pkgname
}

# vim: ft=sh ts=2 sw=2 et

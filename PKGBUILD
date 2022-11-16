# Maintainer: OramahMaalhur <oramahmaalhur@gmail.com>
# Contributor: Pieter Joost van de Sande <pj@born2code.net>
pkgname=argo
pkgver=3.4.3
pkgrel=1
pkgdesc='Workflow engine for Kubernetes'
url='https://github.com/argoproj/argo-workflows'
arch=('x86_64')
license=('Apache-2.0')
makedepends=()
depends=()
source=("${url}/releases/download/v${pkgver}/argo-linux-amd64.gz")
sha256sums=('834a1cc0972a8810dfc39469b176d4dead17b0bc29968974da52d89b59357ac2')

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

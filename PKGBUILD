# Maintainer: Nikola PHILIP-SINIBALDI <contact@patchli.fr>
pkgname=k2tf
pkgver=0.8.0
pkgrel=1
pkgdesc="A tool for converting Kubernetes YAML into Terraform HCL"
arch=('x86_64')
url="https://github.com/sl1pm4t/k2tf"
license=('Apache')
depends=('go')
makedepends=('git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make build
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make test
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 k2tf "$pkgdir/usr/bin/k2tf"
}

# vim:set ts=2 sw=2 et:

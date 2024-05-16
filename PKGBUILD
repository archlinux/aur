# Maintainer: Felipe Alfonso Gonzalez <f.alfonso@res-ear.ch>
pkgname=opticpu
pkgver=0.0.4
pkgrel=1
pkgdesc="A utility for optimizing CPU usage and enhancing system performance on Linux."
arch=('x86_64')
url="https://github.com/felipealfonsog/OptiCPU"
license=('BSD 3-clause')
depends=('gcc' 'glibc' 'libutil-linux' 'coreutils')

source=("https://github.com/felipealfonsog/OptiCPU/archive/refs/tags/v${pkgver}.tar.gz")

build() {
  tar xf "v${pkgver}.tar.gz" -C "$srcdir" --strip-components=1
  cd "$srcdir"
  gcc -o opticpu src/opticpu.c
}

package() {
  cd "$srcdir"
  install -Dm755 opticpu "$pkgdir/usr/bin/opticpu"
}

sha256sums=('44d7ee54c8cc0da285df4c2f8ee99d143d2669e047ba8d104f90f51b81df9f8f')


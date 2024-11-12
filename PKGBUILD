# Maintainer: Felipe Alfonso Gonzalez <f.alfonso@res-ear.ch>
pkgname=opticpu
pkgver=0.0.9
pkgrel=1
pkgdesc="A utility for optimizing CPU usage and enhancing system performance on Linux."
arch=('x86_64')
url="https://github.com/felipealfonsog/OptiCPU"
license=('BSD 3-clause')
depends=('gcc' 'glibc' 'libutil-linux' 'coreutils' 'sysstat' 'cpupower')

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

sha256sums=('1bc4ba27da5cd84dfe30b13ff77f70ab4dcac1b347a2d56fc2f46b594743ef34')



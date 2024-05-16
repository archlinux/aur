# Maintainer: Felipe Alfonso Gonzalez <f.alfonso@res-ear.ch>
pkgname=opticpu
pkgver=0.0.5
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

sha256sums=('4d93e59046b926710b0a9139192f2c375f13280394e0f0230d1a430897632503')


# Maintainer: Felipe Alfonso Gonzalez <f.alfonso@res-ear.ch>
pkgname=opticpu
pkgver=0.0.7
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

sha256sums=('f0408118870bbfacf77ec453729de8193080b081d2e37376b1b02ec410efe21c')



# Maintainer: Felipe Alfonso Gonzalez <f.alfonso@res-ear.ch>
pkgname=opticpu
pkgver=0.0.1
pkgrel=1
pkgdesc="A utility for optimizing CPU usage and enhancing system performance on Linux."
arch=('x86_64')
url="https://github.com/felipealfonsog/OptiCPU"
license=('BSD 3-clause')
depends=('gcc' 'glibc' 'libutil-linux' 'coreutils')

source=("https://github.com/felipealfonsog/OptiCPU/archive/refs/tags/v${pkgver}.tar.gz")

build() {

  tar xf "v${pkgver}.tar.gz" -C "$srcdir" --strip-components=1

  cd "$srcdir"/OptiCPU-v"$pkgver"

  gcc -o opticpu src/opticpu.c
}

#Fixes 12.8.2023
package() {
  #cd "$srcdir/TermNotes-${pkgver}"
  cd "${srcdir}"/OptiCPU-v"${pkgver}"
  install -Dm755 src/opticpu "$pkgdir/usr/bin/opticpu"
}

sha256sums=('234d213d96cd5ba10f575135bde35a0e143c03060490924fd4f968632625bb9e')



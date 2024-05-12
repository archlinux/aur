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
sha256sums=('6174d982d83446134cfd58062256e1da3fd52115f30a69b40e154d32dd511cb3')

build() {
  cd "${srcdir}/OptiCPU-${pkgver}"
  gcc -o opticpu src/opticpu.c
}

package() {
  cd "${srcdir}/OptiCPU-${pkgver}/src"
  install -Dm755 opticpu "${pkgdir}/usr/bin/opticpu"
}


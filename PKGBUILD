# Maintainer: Felipe Alfonso Gonzalez <f.alfonso@res-ear.ch>
pkgname=opticpu
pkgver=1.0
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
  install -Dm755 opticpu "$pkgdir/usr/bin/opticpu"
}

sha256sums=('fdf95e44bd35394c89e1244b18010894c83631f3188d55cf75de01b79266e7dc')



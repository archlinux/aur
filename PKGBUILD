# Maintainer GI Jack <GI_Jack@hackermail.com>

pkgname=aflplusplus
pkgver=4.01c
pkgrel=1
pkgdesc="afl++ is afl with community patches, AFLfast power schedules, qemu 3.1 upgrade + laf-intel support, MOpt mutators, InsTrim instrumentation, unicorn_mode and a lot more!"
arch=('x86_64')
url="https://github.com/AFLplusplus/AFLplusplus"
license=('Apache')
provides=('afl')
conflicts=('afl')
optdepends=('qemu: use QEMU with afl')
source=("https://github.com/AFLplusplus/AFLplusplus/archive/${pkgver}.tar.gz")
sha256sums=('4a0b42a62272c8f07cfba8f5f2fc43a5c072a30d0dbee47732bb2f06ecd7e44f')

prepare() {
  cd "AFLplusplus-${pkgver}"
  make clean
}

build() {
  cd "AFLplusplus-${pkgver}"
  make PREFIX="/usr"
}

package() {
  cd "AFLplusplus-${pkgver}"
  make install PREFIX="/usr" DESTDIR="${pkgdir}"
}


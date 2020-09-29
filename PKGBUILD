# Maintainer GI Jack <GI_Jack@hackermail.com>

pkgname=aflplusplus
pkgver=2.68c
pkgrel=1
pkgdesc="afl++ is afl with community patches, AFLfast power schedules, qemu 3.1 upgrade + laf-intel support, MOpt mutators, InsTrim instrumentation, unicorn_mode and a lot more!"
arch=('x86_64')
url="https://github.com/vanhauser-thc/AFLplusplus"
license=('Apache')
provides=('afl')
conflicts=('afl')
optdepends=('qemu: use QEMU with afl')
source=("https://github.com/AFLplusplus/AFLplusplus/archive/${pkgver}.tar.gz")
sha256sums=('862e155c97737770baa26ffedf324a7fa255b757c85b0c9a6f312264f2ca29c5')

build() {
  cd "AFLplusplus-${pkgver}"
  make PREFIX="/usr"
  make llvm_mode PREFIX="/usr"
}

package() {
  cd "AFLplusplus-${pkgver}"
  make install PREFIX="/usr" DESTDIR="${pkgdir}"
}


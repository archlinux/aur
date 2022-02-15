# Maintainer GI Jack <GI_Jack@hackermail.com>

pkgname=aflplusplus
pkgver=4.00c
pkgrel=1
pkgdesc="afl++ is afl with community patches, AFLfast power schedules, qemu 3.1 upgrade + laf-intel support, MOpt mutators, InsTrim instrumentation, unicorn_mode and a lot more!"
arch=('x86_64')
url="https://github.com/AFLplusplus/AFLplusplus"
license=('Apache')
provides=('afl')
conflicts=('afl')
optdepends=('qemu: use QEMU with afl')
source=("https://github.com/AFLplusplus/AFLplusplus/archive/${pkgver}.tar.gz")
sha256sums=('f427294ed674e37d34a1b756a2190de17937e046ef21abb3ae37bba018a760f1')

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


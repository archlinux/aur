# Maintainer GI Jack <GI_Jack@hackermail.com>

pkgname=aflplusplus
pkgver=3.12c
_pkgver=3.12c
pkgrel=1
pkgdesc="afl++ is afl with community patches, AFLfast power schedules, qemu 3.1 upgrade + laf-intel support, MOpt mutators, InsTrim instrumentation, unicorn_mode and a lot more!"
arch=('x86_64')
url="https://github.com/vanhauser-thc/AFLplusplus"
license=('Apache')
provides=('afl')
conflicts=('afl')
optdepends=('qemu: use QEMU with afl')
source=("https://github.com/AFLplusplus/AFLplusplus/archive/${_pkgver}.tar.gz")
sha256sums=('0240d34a2f99d157063e31d0c2d2801a68bc015e09187d9cc197637ec8fda635')

prepare() {
  cd "AFLplusplus-${_pkgver}"
  make clean
}

build() {
  cd "AFLplusplus-${_pkgver}"
  make PREFIX="/usr"
}

package() {
  cd "AFLplusplus-${_pkgver}"
  make install PREFIX="/usr" DESTDIR="${pkgdir}"
}


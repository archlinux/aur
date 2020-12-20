# Maintainer GI Jack <GI_Jack@hackermail.com>

pkgname=aflplusplus
pkgver=3.00c
_pkgver=3.0c
pkgrel=1
pkgdesc="afl++ is afl with community patches, AFLfast power schedules, qemu 3.1 upgrade + laf-intel support, MOpt mutators, InsTrim instrumentation, unicorn_mode and a lot more!"
arch=('x86_64')
url="https://github.com/vanhauser-thc/AFLplusplus"
license=('Apache')
provides=('afl')
conflicts=('afl')
optdepends=('qemu: use QEMU with afl')
source=("https://github.com/AFLplusplus/AFLplusplus/archive/${_pkgver}.tar.gz")
sha256sums=('75a2cd6c9e14d4160defcf4899c6d654eba9ae1aad2b2c850bb165c84ee763bb')

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


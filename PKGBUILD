# Maintainer GI Jack <GI_Jack@hackermail.com>

pkgname=aflplusplus
pkgver=4.20c
pkgrel=1
pkgdesc="afl++ is afl with community patches, AFLfast power schedules, qemu 3.1 upgrade + laf-intel support, MOpt mutators, InsTrim instrumentation, unicorn_mode and a lot more!"
arch=('x86_64')
url="https://github.com/AFLplusplus/AFLplusplus"
license=('Apache')
provides=('afl')
conflicts=('afl')
optdepends=('qemu: use QEMU with afl'
            'lld')
source=("https://github.com/AFLplusplus/AFLplusplus/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('855ddefbe9c88911146c1b7cb50dc5423b7623a7a59343f34f31bf038a865a24')

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


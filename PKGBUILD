# Maintainer GI Jack <GI_Jack@hackermail.com>

pkgname=aflplusplus
pkgver=4.08c
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
sha256sums=('f8d93f2343a040323b88f0d09c93be33b043bf63ba483af45510cb85aa1a2305')

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


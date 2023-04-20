# Maintainer GI Jack <GI_Jack@hackermail.com>

pkgname=aflplusplus
pkgver=4.06c
pkgrel=1
pkgdesc="afl++ is afl with community patches, AFLfast power schedules, qemu 3.1 upgrade + laf-intel support, MOpt mutators, InsTrim instrumentation, unicorn_mode and a lot more!"
arch=('x86_64')
url="https://github.com/AFLplusplus/AFLplusplus"
license=('Apache')
provides=('afl')
conflicts=('afl')
optdepends=('qemu: use QEMU with afl'
            'lld')
source=("https://github.com/AFLplusplus/AFLplusplus/archive/${pkgver}.tar.gz")
sha256sums=('98ef9d9a1eee10b1642067700a3ea2ff87ee7aa6ca4a15cb924053c41d119423')

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


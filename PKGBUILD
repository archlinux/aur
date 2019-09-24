# Maintainer: B.C. van Zuiden <zuiden@ilorentz.org>
_pkgname=aflplusplus
pkgname=${_pkgname}-git
pkgver=2.54c
pkgrel=1
pkgdesc="afl++ is afl with community patches, AFLfast power schedules, qemu 3.1 upgrade + laf-intel support, MOpt mutators, InsTrim instrumentation, unicorn_mode and a lot more!"
arch=('x86_64')
url="https://github.com/vanhauser-thc/AFLplusplus"
license=('Apache')
makedepends=('git')
provides=('afl')
conflicts=('afl')
source=('git://github.com/vanhauser-thc/AFLplusplus.git')
sha256sums=('SKIP')

build()
{
    cd AFLplusplus
    make PREFIX="/usr"
    make llvm_mode PREFIX="/usr"
}

package()
{
    cd AFLplusplus
    make install PREFIX="/usr" DESTDIR="${pkgdir}"
}

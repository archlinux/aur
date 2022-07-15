# Maintainer: B.C. van Zuiden <zuiden@ilorentz.org>
_pkgname=aflplusplus
pkgname=${_pkgname}-git
pkgver=4.01c.r49.gc57988e6
pkgrel=1
pkgdesc="The fuzzer afl++ is afl with community patches, qemu 5.1 upgrade, collision-free coverage, enhanced laf-intel & redqueen, AFLfast++ power schedules, MOpt mutators, unicorn_mode, and a lot more!"
arch=('x86_64')
url="https://github.com/AFLplusplus/AFLplusplus"
license=('Apache')
makedepends=('git')
provides=('afl')
conflicts=('afl')
source=("git+https://github.com/AFLplusplus/AFLplusplus.git")
sha256sums=('SKIP')

pkgver() {
    cd AFLplusplus
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build()
{
    cd AFLplusplus
    make PREFIX="/usr"
}

package()
{
    cd AFLplusplus
    make install PREFIX="/usr" DESTDIR="${pkgdir}"
}

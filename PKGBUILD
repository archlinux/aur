# Maintainer: plokid <910576949@qq.com>

_java=8
_pkgname=dragonwell
pkgname=jdk$_java-$_pkgname-extended-bin
pkgver=8.14.15
_pkgver=8u362
pkgrel=1
pkgdesc="an in-house OpenJDK implementation at Alibaba (Extended Edition)"
arch=("x86_64" "aarch64")
url="https://dragonwell-jdk.io/"
license=('GPL2')
depends=('ca-certificates-utils' 'java-environment-common' 'java-runtime-common' 'nss')
provides=(
    "java-environment=${_java}" 
    "java-environment-openjdk=${_java}"
    "java-runtime=${_java}" 
    "java-runtime-openjdk=${_java}"
    "java-runtime-headless=${_java}"
    "java-runtime-headless-openjdk=${_java}"
)
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/alibaba/dragonwell8/releases/download/dragonwell-extended-${pkgver}_jdk${_pkgver}-ga/Alibaba_Dragonwell_Extended_${pkgver}_x64_linux.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/alibaba/dragonwell8/releases/download/dragonwell-extended-${pkgver}_jdk${_pkgver}-ga/Alibaba_Dragonwell_Extended_${pkgver}_aarch64_linux.tar.gz")
sha256sums_x86_64=('c3858ce1c7310fd0984b0c3906a273b27207e40fca426759dbdf570ae748454e')
sha256sums_aarch64=('77556147af80cc1c0e65e311a01092cee73dd17f1085726ffaed7dffc1f8e1b3')

package() {
    install -d $pkgdir/usr/lib/jvm/java-8-dragonwell-extended
    mv $srcdir/dragonwell-$pkgver/* $pkgdir/usr/lib/jvm/java-8-dragonwell-extended
}

# Maintainer: plokid <910576949@qq.com>

_java=11
_pkgname=dragonwell
pkgname=jdk$_java-$_pkgname-bin
pkgver=11.0.15.11
_pkgver=11.0.15
__pkgver=11.0.15.11.9
pkgrel=2
pkgdesc="Alibaba Dragonwell, as a downstream version of OpenJDK, is the OpenJDK implementation at Alibaba optimized for online e-commerce, financial, logistics applications running on 100,000+ servers."
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
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/alibaba/dragonwell11/releases/download/dragonwell-${pkgver}_jdk-${_pkgver}-ga/Alibaba_Dragonwell_${__pkgver}_x64_linux.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/alibaba/dragonwell11/releases/download/dragonwell-${pkgver}_jdk-${_pkgver}-ga/Alibaba_Dragonwell_${__pkgver}_aarch64_linux.tar.gz")
sha256sums_x86_64=('2406a9b12682d443aa606213d6c00ec83d96b2d157a70728edd6b9bca80c4eab')
sha256sums_aarch64=('459bec951d0b2d610bda8cc1fd649406abe4edc8bcda78568b2fca828993f040')

package() {
    install -d $pkgdir/usr/lib/jvm/java-11-dragonwell
    mv $srcdir/dragonwell-*/* $pkgdir/usr/lib/jvm/java-11-dragonwell
}

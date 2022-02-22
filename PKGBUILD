# Maintainer: plokid <910576949@qq.com>

_java=11
_pkgname=dragonwell
pkgname="jdk${_java}-${_pkgname}-bin"
pkgver=11.0.14.10
_pkgver=11.0.14
__pkgver=11.0.14.10+0-GA
pkgrel=1
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
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/alibaba/dragonwell11/releases/download/dragonwell-${pkgver}_jdk-${_pkgver}-ga/Alibaba_Dragonwell_${pkgver}_x64_linux.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/alibaba/dragonwell11/releases/download/dragonwell-${pkgver}_jdk-${_pkgver}-ga/Alibaba_Dragonwell_${pkgver}_aarch64_linux.tar.gz")
sha256sums_x86_64=('f44fe94aa5ef14a67ed446698dd055ac1ab726ecb516de16b3cab24c666a71ae')
sha256sums_aarch64=('4c45345734076495d5a838d67c7957c078de913a708242087130c0627716187e')

package() {
    install -d $pkgdir/usr/lib/jvm/java-11-dragonwell
    mv $srcdir/dragonwell-$__pkgver/* $pkgdir/usr/lib/jvm/java-11-dragonwell
}

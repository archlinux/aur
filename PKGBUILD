# Maintainer: plokid <910576949@qq.com>

_java=17
_pkgname=dragonwell
pkgname="jdk${_java}-${_pkgname}-bin"
pkgver=17.0.2.0.2
_pkgver=17.0.2.0.2+8-GA
__pkgver=17.0.2
pkgrel=1
pkgdesc="Alibaba Dragonwell, as a downstream version of OpenJDK, is the OpenJDK implementation at Alibaba optimized for online e-commerce, financial, logistics applications running on 100,000+ servers."
arch=("x86_64" "aarch64")
url="https://dragonwell-jdk.io"
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
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/alibaba/dragonwell17/releases/download/dragonwell-${_pkgver}_jdk-${__pkgver}-ga/Alibaba_Dragonwell_${_pkgver}_x64_linux.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/alibaba/dragonwell17/releases/download/dragonwell-${_pkgver}_jdk-${__pkgver}-ga/Alibaba_Dragonwell_${_pkgver}_aarch64_linux.tar.gz")
sha256sums_x86_64=('a345601439294b56831ecdd1366ac4006c3828e25f18a0fc59f34aa07387a97b')
sha256sums_aarch64=('cc9f9fbd33c117f164eacfbafa2ae92270d88bc9b3d4ea4a862a20cacdcf9115')

package() {
    install -d $pkgdir/usr/lib/jvm/java-17-dragonwell
    mv $srcdir/dragonwell-$_pkgver/* $pkgdir/usr/lib/jvm/java-17-dragonwell
}

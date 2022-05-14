# Maintainer: plokid <910576949@qq.com>

_java=17
_pkgname=dragonwell
pkgname=jdk$_java-$_pkgname-bin
pkgver=17.0.3.0.3
_pkgver=17.0.3.0.3+7
__pkgver=17.0.3
pkgrel=2
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
sha256sums_x86_64=('8431922266c1a476e1ca2d49c68110c22ec4f989ca0438b0b089ecd9c7ade0ce')
sha256sums_aarch64=('84c9571fccb7e028c59657712e686cd1560d760a560ee8c76d0f99e2795aafcd')

package() {
    install -d $pkgdir/usr/lib/jvm/java-17-dragonwell
    mv $srcdir/dragonwell-$_pkgver-GA/* $pkgdir/usr/lib/jvm/java-17-dragonwell
}

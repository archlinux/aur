# Maintainer: plokid <910576949@qq.com>

_java=11
_pkgname=dragonwell
pkgname="jdk${_java}-${_pkgname}-bin"
pkgver=11.0.13.9
_pkgver=11.0.13
__pkgver=11.0.13.9+0
pkgrel=1
pkgdesc="Alibaba Dragonwell, as a downstream version of OpenJDK, is the OpenJDK implementation at Alibaba optimized for online e-commerce, financial, logistics applications running on 100,000+ servers."
arch=("x86_64" "aarch64")
url="https://github.com/alibaba/dragonwell11"
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
sha256sums_x86_64=('f2553f6beb567f0e5c3ed4fd22339e05e534b8b283802265cb147d883ad6ca64')
sha256sums_aarch64=('04edcefd10f3d058b1691e73c25d91ad28870809847a5c092bc9096595f0de35')

package() {
    install -d $pkgdir/usr/lib/jvm/java-11-dragonwell
    mv $srcdir/jdk-$__pkgver/* $pkgdir/usr/lib/jvm/java-11-dragonwell
}

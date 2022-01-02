# Maintainer: plokid <910576949@qq.com>

_java=17
_pkgname=dragonwell
pkgname="jdk${_java}-${_pkgname}-bin"
pkgver=17.0.1.0.1
_pkgver=17.0.1.0.1+12
__pkgver=17.0.1
pkgrel=1
pkgdesc="Alibaba Dragonwell, as a downstream version of OpenJDK, is the OpenJDK implementation at Alibaba optimized for online e-commerce, financial, logistics applications running on 100,000+ servers."
arch=("x86_64" "aarch64")
url="https://github.com/alibaba/dragonwell17"
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
sha256sums_x86_64=('9070ba1e70edb984d4a270bf21114a0b388f84a76b500e0c168540892b3399b2')
sha256sums_aarch64=('150ebfc4e2a34e5abe9069a82eef95daf4771c9e18ab2a1af629a4e2a0007f85')

package() {
    install -d $pkgdir/usr/lib/jvm/java-17-dragonwell
    mv $srcdir/jdk-$_pkgver/* $pkgdir/usr/lib/jvm/java-17-dragonwell
}

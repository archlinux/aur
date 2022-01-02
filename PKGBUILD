# Maintainer: plokid <910576949@qq.com>

_java=8
_pkgname=dragonwell
pkgname="jdk${_java}-${_pkgname}-bin"
pkgver=8.9.10
_pkgver=8u312
__pkgver=8u312-b01
pkgrel=1
pkgdesc="Alibaba Dragonwell, as a downstream version of OpenJDK, is the OpenJDK implementation at Alibaba optimized for online e-commerce, financial, logistics applications running on 100,000+ servers."
arch=("x86_64" "aarch64")
url="https://github.com/alibaba/dragonwell8"
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
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/alibaba/dragonwell8/releases/download/dragonwell-${pkgver}_jdk${_pkgver}-ga/Alibaba_Dragonwell_${pkgver}_x64_linux.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/alibaba/dragonwell8/releases/download/dragonwell-${pkgver}_jdk${_pkgver}-ga/Alibaba_Dragonwell_${pkgver}_aarch64_linux.tar.gz")
sha256sums_x86_64=('2e1dfdacfe64a6b2f797cffd7ff8ee8cf6424d29fa594376a6916b1686a38433')
sha256sums_aarch64=('8f4a5fb7d2f0e633b1280c41e89a1bef325346679feda912b21b368c1df4f5df')

package() {
    install -d $pkgdir/usr/lib/jvm/java-8-dragonwell
    mv $srcdir/jdk$__pkgver/* $pkgdir/usr/lib/jvm/java-8-dragonwell
}

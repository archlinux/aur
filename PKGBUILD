# Maintainer: plokid <910576949@qq.com>

_java=8
_pkgname=dragonwell
pkgname=jdk$_java-$_pkgname-extended-bin
pkgver=8.12.13
_pkgver=8u345
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
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/alibaba/dragonwell8/releases/download/dragonwell-extended-${pkgver}_jdk${_pkgver}-ga/Alibaba_Dragonwell_Extended_${pkgver}_x64_linux.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/alibaba/dragonwell8/releases/download/dragonwell-extended-${pkgver}_jdk${_pkgver}-ga/Alibaba_Dragonwell_Extended_${pkgver}_aarch64_linux.tar.gz")
sha256sums_x86_64=('0bb3a9b6109e29da6c7a0534cff9f34a0a16cab79ea850ebac7f7f9cfd071148')
sha256sums_aarch64=('12a8620a55dd85dc604bad71a770e235bbb773a301f5c1e12ba00c4d2bb9cea0')

package() {
    install -d $pkgdir/usr/lib/jvm/java-8-dragonwell-extended
    mv $srcdir/dragonwell-$pkgver/* $pkgdir/usr/lib/jvm/java-8-dragonwell-extended
}

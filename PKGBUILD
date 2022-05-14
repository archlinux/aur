# Maintainer: plokid <910576949@qq.com>

_java=8
_pkgname=dragonwell
pkgname=jdk$_java-$_pkgname-bin
pkgver=8.11.12
_pkgver=8u332
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
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/alibaba/dragonwell8/releases/download/dragonwell-${pkgver}_jdk${_pkgver}-ga/Alibaba_Dragonwell_${pkgver}_x64_linux.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/alibaba/dragonwell8/releases/download/dragonwell-${pkgver}_jdk${_pkgver}-ga/Alibaba_Dragonwell_${pkgver}_aarch64_linux.tar.gz")
sha256sums_x86_64=('03923f200dffddf9eee2aadc0c495674fe0b87cc2eece94a9a8dec84812d12bd')
sha256sums_aarch64=('544a2b75c1b5963664395fba4b58bc6012cd1db36b68c0f1886d81d657a0b24b')

package() {
    install -d $pkgdir/usr/lib/jvm/java-8-dragonwell
    mv $srcdir/dragonwell-$pkgver/* $pkgdir/usr/lib/jvm/java-8-dragonwell
}

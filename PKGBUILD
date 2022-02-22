# Maintainer: plokid <910576949@qq.com>

_java=8
_pkgname=dragonwell
pkgname="jdk${_java}-${_pkgname}-bin"
pkgver=8.10.11
_pkgver=8u322
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
sha256sums_x86_64=('f81a565570ab799c0cb6079b7b9e9011bd3981a94f5db61039daae305cda1609')
sha256sums_aarch64=('0cef113ff67338881a77f663b6562b96d181b4ac49cf4a27f65d3f615f6d04e8')

package() {
    install -d $pkgdir/usr/lib/jvm/java-8-dragonwell
    mv $srcdir/dragonwell-$pkgver/* $pkgdir/usr/lib/jvm/java-8-dragonwell
}

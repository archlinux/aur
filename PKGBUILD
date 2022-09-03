# Maintainer: plokid <910576949@qq.com>

_java=11
_pkgname=dragonwell
pkgname=jdk$_java-$_pkgname-extended-bin
pkgver=11.0.16.12
_pkgver=11.0.16
__pkgver=11.0.16.12.8
pkgrel=1
pkgdesc="an in-house OpenJDK implementation at Alibaba (Extended Edition)"
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
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/alibaba/dragonwell11/releases/download/dragonwell-extended-${pkgver}_jdk-${_pkgver}-ga/Alibaba_Dragonwell_Extended_${__pkgver}_x64_linux.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/alibaba/dragonwell11/releases/download/dragonwell-extended-${pkgver}_jdk-${_pkgver}-ga/Alibaba_Dragonwell_Extended_${__pkgver}_aarch64_linux.tar.gz")
sha256sums_x86_64=('47b904df8fa702cb7a454666cbc27dafc40d3c7c73c5178e0d9ebe2fc9b9352a')
sha256sums_aarch64=('28ff34de82a1c020350c7b61b040a03b9e039cb5db4389e6af5711bb52abe4f3')

package() {
    install -d $pkgdir/usr/lib/jvm/java-11-dragonwell-extended
    mv $srcdir/dragonwell-*/* $pkgdir/usr/lib/jvm/java-11-dragonwell-extended
}

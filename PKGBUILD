# Maintainer: plokid <910576949@qq.com>

_java=11
_pkgname=dragonwell
pkgname=jdk$_java-$_pkgname-standard-bin
pkgver=11.0.18.14
_pkgver=11.0.18
__pkgver=11.0.18.14.9
pkgrel=1
pkgdesc="an in-house OpenJDK implementation at Alibaba (Standard Edition)"
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
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/alibaba/dragonwell11/releases/download/dragonwell-standard-${pkgver}_jdk-${_pkgver}-ga/Alibaba_Dragonwell_Standard_${__pkgver}_x64_linux.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/alibaba/dragonwell11/releases/download/dragonwell-standard-${pkgver}_jdk-${_pkgver}-ga/Alibaba_Dragonwell_Standard_${__pkgver}_aarch64_linux.tar.gz")
sha256sums_x86_64=('2360b063f1099c0ab7def15ec83c7344ae21038e5a85139132dc4005a8d5a940')
sha256sums_aarch64=('cc05189481c899c434e25320bf3de9c03b72ac7e1bc2950fe749ed9063340f65')

package() {
    install -d $pkgdir/usr/lib/jvm/java-11-dragonwell-standard
    mv $srcdir/dragonwell-*/* $pkgdir/usr/lib/jvm/java-11-dragonwell-standard
}

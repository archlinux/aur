# Maintainer: plokid <910576949@qq.com>

_java=8
_pkgname=dragonwell
pkgname=jdk$_java-$_pkgname-standard-bin
pkgver=8.14.15
_pkgver=8u362
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
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/alibaba/dragonwell8/releases/download/dragonwell-standard-${pkgver}_jdk${_pkgver}-ga/Alibaba_Dragonwell_Standard_${pkgver}_x64_linux.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/alibaba/dragonwell8/releases/download/dragonwell-standard-${pkgver}_jdk${_pkgver}-ga/Alibaba_Dragonwell_Standard_${pkgver}_aarch64_linux.tar.gz")
sha256sums_x86_64=('5d28a375543d2264ee54b3b9713ac63f8465526b7d6daf3701aa8a95daab7880')
sha256sums_aarch64=('28e378fc28a8b7ce309c331cf9a782d5298d3679faa1c1a28dbb87e39c5aeca0')

package() {
    install -d $pkgdir/usr/lib/jvm/java-8-dragonwell-standard
    mv $srcdir/dragonwell-$pkgver/* $pkgdir/usr/lib/jvm/java-8-dragonwell-standard
}

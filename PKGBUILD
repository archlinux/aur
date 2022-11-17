# Maintainer: plokid <910576949@qq.com>

_java=11
_pkgname=dragonwell
pkgname=jdk$_java-$_pkgname-standard-bin
pkgver=11.0.17.13
_pkgver=11.0.17
__pkgver=11.0.17.13.8
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
sha256sums_x86_64=('089e8e10956316a91ccb00ee64642df9b9182cc3da7a6354eaf5c4f87f39afb1')
sha256sums_aarch64=('14c4a17a65bf478b25410714433f5af8df0a0ffaaedf6d94b8901f8b7ecbfa8a')

package() {
    install -d $pkgdir/usr/lib/jvm/java-11-dragonwell-standard
    mv $srcdir/dragonwell-*/* $pkgdir/usr/lib/jvm/java-11-dragonwell-standard
}

# Maintainer: plokid <910576949@qq.com>

_java=11
_pkgname=dragonwell
pkgname=jdk$_java-$_pkgname-standard-bin
pkgver=11.0.16.12
_pkgver=11.0.16
__pkgver=11.0.16.12.8
pkgrel=2
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
sha256sums_x86_64=('42d673d9effff252140e1402959881c3f255ee3a8b8776871fd8e775facb9584')
sha256sums_aarch64=('bd930ac692bcd2e511cdf5c55a3adddfe18375af79a36dd843d8b52bdb574f5f')

package() {
    install -d $pkgdir/usr/lib/jvm/java-11-dragonwell-standard
    mv $srcdir/dragonwell-*/* $pkgdir/usr/lib/jvm/java-11-dragonwell-standard
}

# Maintainer: plokid <910576949@qq.com>

_java=17
_pkgname=dragonwell
pkgname=jdk$_java-$_pkgname-standard-bin
pkgver=17.0.5.0.5
_pkgver=17.0.5.0.5+8
_pkgver_=17.0.5.0.5.8
__pkgver=17.0.5
pkgrel=1
pkgdesc="an in-house OpenJDK implementation at Alibaba (Standard Edition)"
arch=("x86_64" "aarch64")
url="https://dragonwell-jdk.io"
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
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/alibaba/dragonwell17/releases/download/dragonwell-standard-${_pkgver}_jdk-${__pkgver}-ga/Alibaba_Dragonwell_Standard_${_pkgver_}_x64_linux.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/alibaba/dragonwell17/releases/download/dragonwell-standard-${_pkgver}_jdk-${__pkgver}-ga/Alibaba_Dragonwell_Standard_${_pkgver_}_aarch64_linux.tar.gz")
sha256sums_x86_64=('a505dea63fd58925a1512dad77d5fdc9bc6c2ebb42f065001091eb31e30ed43f')
sha256sums_aarch64=('929be7d0d0aa7c2bd196db4b6f3ead10dbeb240afc9db6c68974e79961c59003')

package() {
    install -d $pkgdir/usr/lib/jvm/java-17-dragonwell-standard
    mv $srcdir/dragonwell-$_pkgver-GA/* $pkgdir/usr/lib/jvm/java-17-dragonwell-standard
}

# Maintainer: plokid <910576949@qq.com>

_java=17
_pkgname=dragonwell
pkgname=jdk$_java-$_pkgname-standard-bin
pkgver=17.0.4.0.4
_pkgver=17.0.4.0.4+8
__pkgver=17.0.4
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
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/alibaba/dragonwell17/releases/download/dragonwell-standard-${_pkgver}_jdk-${__pkgver}-ga/Alibaba_Dragonwell_Standard_${_pkgver}_x64_linux.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/alibaba/dragonwell17/releases/download/dragonwell-standard-${_pkgver}_jdk-${__pkgver}-ga/Alibaba_Dragonwell_Standard_${_pkgver}_aarch64_linux.tar.gz")
sha256sums_x86_64=('31b3b6293b6645de7c531d16427ec38809ffaa0ef2db9a29c9c2230c5dc10eec')
sha256sums_aarch64=('1e7b974b860e9062c8a65dab4c71f84b20527b08866062a67c38963017a5f3fe')

package() {
    install -d $pkgdir/usr/lib/jvm/java-17-dragonwell-standard
    mv $srcdir/dragonwell-$_pkgver-GA/* $pkgdir/usr/lib/jvm/java-17-dragonwell-standard
}

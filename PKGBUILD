# Maintainer: plokid <910576949@qq.com>

_java=8
_pkgname=dragonwell
pkgname=jdk$_java-$_pkgname-standard-bin
pkgver=8.12.13
_pkgver=8u345
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
sha256sums_x86_64=('64c00ba16e2eb4bf5f867f6a0604d8f82e0627c61d45d7edddc87cec641d9dd7')
sha256sums_aarch64=('b368b47f771be507b96e435b1a5fc41cb133762cdc86a7801150f25bf1e58421')

package() {
    install -d $pkgdir/usr/lib/jvm/java-8-dragonwell-standard
    mv $srcdir/dragonwell-$pkgver/* $pkgdir/usr/lib/jvm/java-8-dragonwell-standard
}

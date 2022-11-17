# Maintainer: plokid <910576949@qq.com>

_java=8
_pkgname=dragonwell
pkgname=jdk$_java-$_pkgname-standard-bin
pkgver=8.13.14
_pkgver=8u352
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
sha256sums_x86_64=('45b20c04ba93f8c25f1dcc75966bec461224ee9f875fdf3f49a09eb4606f3149')
sha256sums_aarch64=('1cc019db94abf0b828620565c1118f96ef6884ad394bf96b77786c26771be61c')

package() {
    install -d $pkgdir/usr/lib/jvm/java-8-dragonwell-standard
    mv $srcdir/dragonwell-$pkgver/* $pkgdir/usr/lib/jvm/java-8-dragonwell-standard
}

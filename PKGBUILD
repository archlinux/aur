# Maintainer: plokid <910576949@qq.com>

_java=17
_pkgname=dragonwell
pkgname=jdk$_java-$_pkgname-standard-bin
pkgver=17.0.6.0.6
_pkgver=17.0.6.0.6+9
_pkgver_=17.0.6.0.6.9
__pkgver=17.0.6
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
sha256sums_x86_64=('d70c5feeb106c41f2481b92e214c1a9413db5697daafa754920e65bef24b9872')
sha256sums_aarch64=('81eb71b50d81d5325820ac366e246d722973285bc74b66d564060156b8a6908f')

package() {
    install -d $pkgdir/usr/lib/jvm/java-17-dragonwell-standard
    mv $srcdir/dragonwell-$_pkgver-GA/* $pkgdir/usr/lib/jvm/java-17-dragonwell-standard
}

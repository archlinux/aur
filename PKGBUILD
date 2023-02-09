# Maintainer: plokid <910576949@qq.com>

_java=11
_pkgname=dragonwell
pkgname=jdk$_java-$_pkgname-extended-bin
pkgver=11.0.18.14
_pkgver=11.0.18
__pkgver=11.0.18.14.9
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
sha256sums_x86_64=('4d02a4cce2d13ead8d54650c5e9bf560a6a1f79b6e7281fbb46e31ea3c20a341')
sha256sums_aarch64=('04d257942c75eb487075b675da0dcec6319dbf9dcdc5ed93eafbd427398f4e08')

package() {
    install -d $pkgdir/usr/lib/jvm/java-11-dragonwell-extended
    mv $srcdir/dragonwell-*/* $pkgdir/usr/lib/jvm/java-11-dragonwell-extended
}

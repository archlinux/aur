# Maintainer: plokid <910576949@qq.com>

_java=11
_pkgname=dragonwell
pkgname=jdk$_java-$_pkgname-extended-bin
pkgver=11.0.17.13
_pkgver=11.0.17
__pkgver=11.0.17.13.8
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
sha256sums_x86_64=('9a01b3799883485263158241625a7abf72d4696cb2f3a7e069f1b5df8d1e30cd')
sha256sums_aarch64=('d56122ebfee4ded7066955675f0ac2474ef6355547e9de838cd18bf7c7d8ac57')

package() {
    install -d $pkgdir/usr/lib/jvm/java-11-dragonwell-extended
    mv $srcdir/dragonwell-*/* $pkgdir/usr/lib/jvm/java-11-dragonwell-extended
}

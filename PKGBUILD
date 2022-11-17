# Maintainer: plokid <910576949@qq.com>

_java=8
_pkgname=dragonwell
pkgname=jdk$_java-$_pkgname-extended-bin
pkgver=8.13.14
_pkgver=8u352
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
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/alibaba/dragonwell8/releases/download/dragonwell-extended-${pkgver}_jdk${_pkgver}-ga/Alibaba_Dragonwell_Extended_${pkgver}_x64_linux.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/alibaba/dragonwell8/releases/download/dragonwell-extended-${pkgver}_jdk${_pkgver}-ga/Alibaba_Dragonwell_Extended_${pkgver}_aarch64_linux.tar.gz")
sha256sums_x86_64=('b9219b1b9d97069591b240a78003d0a8e782e84a8b7b1d08749afe7565d4e409')
sha256sums_aarch64=('87546423fa952bfbf52a4f8aafa89ae579bc498c5d139d8e30063da625aa5a88')

package() {
    install -d $pkgdir/usr/lib/jvm/java-8-dragonwell-extended
    mv $srcdir/dragonwell-$pkgver/* $pkgdir/usr/lib/jvm/java-8-dragonwell-extended
}

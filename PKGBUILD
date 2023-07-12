# Maintainer: plokid <910576949@qq.com>

_java=8
_pkgname=dragonwell
pkgname=jdk$_java-$_pkgname-standard-bin
pkgver=8.15.16
_pkgver=8u372
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
source=("LICENSE::https://github.com/dragonwell-project/dragonwell8/raw/master/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/alibaba/dragonwell8/releases/download/dragonwell-standard-${pkgver}_jdk${_pkgver}-ga/Alibaba_Dragonwell_Standard_${pkgver}_x64_linux.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/alibaba/dragonwell8/releases/download/dragonwell-standard-${pkgver}_jdk${_pkgver}-ga/Alibaba_Dragonwell_Standard_${pkgver}_aarch64_linux.tar.gz")
sha256sums=('4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726')
sha256sums_x86_64=('a5da46c30e955d435c19dccbb494d02e52167fafd2d9b0b2f1b88005808cedad')
sha256sums_aarch64=('8bd8bbbda4b42b8c24dc86ba2a425d061dc64dad8961c3ff3a0d486b38f0fce1')

package() {
    install -d $pkgdir/usr/lib/jvm/java-8-dragonwell-standard
    mv $srcdir/dragonwell-$pkgver/* $pkgdir/usr/lib/jvm/java-8-dragonwell-standard
    rm $pkgdir/usr/lib/jvm/java-8-dragonwell-standard/src.zip
    install -Dm644 $srcdir/LICENSE $pkgdir/usr/share/licenses/java-8-dragonwell-standard/LICENSE
}

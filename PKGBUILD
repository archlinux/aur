# Maintainer: plokid <910576949@qq.com>

_java=11
_pkgname=dragonwell
pkgname=jdk$_java-$_pkgname-standard-bin
pkgver=11.0.19.15
_pkgver=11.0.19
__pkgver=11.0.19.15.7
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
source=("LICENSE::https://github.com/dragonwell-project/dragonwell11/raw/master/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/dragonwell-project/dragonwell11/releases/download/dragonwell-standard-${pkgver}_jdk-${_pkgver}-ga/Alibaba_Dragonwell_Standard_${__pkgver}_x64_linux.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/dragonwell-project/dragonwell11/releases/download/dragonwell-standard-${pkgver}_jdk-${_pkgver}-ga/Alibaba_Dragonwell_Standard_${__pkgver}_aarch64_linux.tar.gz")
sha256sums=('4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726')
sha256sums_x86_64=('8e366911f86b77a81fbc44dbe839c61240343c020dbf8c1526d4061bccdf27a5')
sha256sums_aarch64=('b9f76545f91e990434001162254767aa43073e5ebab4d76cc85388b21920ce6f')

package() {
    install -d $pkgdir/usr/lib/jvm/java-11-dragonwell-standard
    mv $srcdir/dragonwell-*/* $pkgdir/usr/lib/jvm/java-11-dragonwell-standard
    install -Dm644 $srcdir/LICENSE $pkgdir/usr/share/licenses/java-11-dragonwell-standard/LICENSE
}

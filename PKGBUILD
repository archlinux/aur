# Maintainer: plokid <910576949@qq.com>

_java=17
_pkgname=dragonwell
pkgname=jdk$_java-$_pkgname-standard-bin
pkgver=17.0.7.0.7
_pkgver=17.0.7.0.7+7
_pkgver_=17.0.7.0.7.7
__pkgver=17.0.7
pkgrel=3
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
source=("LICENSE::https://github.com/alibaba/dragonwell8/raw/master/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/alibaba/dragonwell17/releases/download/dragonwell-standard-${_pkgver}_jdk-${__pkgver}-ga/Alibaba_Dragonwell_Standard_${_pkgver_}_x64_linux.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/alibaba/dragonwell17/releases/download/dragonwell-standard-${_pkgver}_jdk-${__pkgver}-ga/Alibaba_Dragonwell_Standard_${_pkgver_}_aarch64_linux.tar.gz")
sha256sums=('4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726')
sha256sums_x86_64=('71da2a40da319df3cc80374fee33d041c87449418350e0762e093a32fe383e69')
sha256sums_aarch64=('4ea898126aa125d0c63f3e3e69ab8e4debbde28edc6966a75b5b7a334effbea4')

package() {
    install -d $pkgdir/usr/lib/jvm/java-17-dragonwell-standard
    mv $srcdir/dragonwell-$_pkgver-GA/* $pkgdir/usr/lib/jvm/java-17-dragonwell-standard
    install -Dm664 LICENSE $pkgdir/usr/share/licenses/java-17-dragonwell-standard/LISENCE
}

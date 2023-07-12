# Maintainer: plokid <910576949@qq.com>

_java=11
_pkgname=dragonwell
pkgname=jdk$_java-$_pkgname-extended-bin
pkgver=11.0.19.15
_pkgver=11.0.19
__pkgver=11.0.19.15.7
pkgrel=2
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
source=("LICENSE::https://github.com/dragonwell-project/dragonwell11/raw/master/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/dragonwell-project/dragonwell11/releases/download/dragonwell-extended-${pkgver}_jdk-${_pkgver}-ga/Alibaba_Dragonwell_Extended_${__pkgver}_x64_linux.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/dragonwell-project/dragonwell11/releases/download/dragonwell-extended-${pkgver}_jdk-${_pkgver}-ga/Alibaba_Dragonwell_Extended_${__pkgver}_aarch64_linux.tar.gz")
sha256sums=('4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726')
sha256sums_x86_64=('98a113a260ce476c393aebda5d4ec6ef492d0aadcb7f9e8e86d0d899f1d9b2b1')
sha256sums_aarch64=('7bf5187fc7882e3c6a3717ae852f3bc654e6e959d569da170bbfebc280e398b8')

package() {
    install -d $pkgdir/usr/lib/jvm/java-11-dragonwell-extended
    mv $srcdir/dragonwell-*/* $pkgdir/usr/lib/jvm/java-11-dragonwell-extended
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/java-11-dragonwell-extended/LICENSE
}

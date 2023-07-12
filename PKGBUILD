# Maintainer: plokid <910576949@qq.com>

_java=8
_pkgname=dragonwell
pkgname=jdk$_java-$_pkgname-extended-bin
pkgver=8.15.16
_pkgver=8u372
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
source=("LICENSE::https://github.com/dragonwell-project/dragonwell8/raw/master/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/alibaba/dragonwell8/releases/download/dragonwell-extended-${pkgver}_jdk${_pkgver}-ga/Alibaba_Dragonwell_Extended_${pkgver}_x64_linux.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/alibaba/dragonwell8/releases/download/dragonwell-extended-${pkgver}_jdk${_pkgver}-ga/Alibaba_Dragonwell_Extended_${pkgver}_aarch64_linux.tar.gz")
sha256sums=('4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726')
sha256sums_x86_64=('f50a0695cce5cdfea78de4cc369ef1213137fc05ebdfe438be022a3d2cdde05a')
sha256sums_aarch64=('42f9f6630eb77c0a273c1952139edb3b87d5f14b6795eceb14f20b03df402c33')

package() {
    install -d $pkgdir/usr/lib/jvm/java-8-dragonwell-extended
    mv $srcdir/dragonwell-$pkgver/* $pkgdir/usr/lib/jvm/java-8-dragonwell-extended
    rm $pkgdir/usr/lib/jvm/java-8-dragonwell-extended/src.zip
    install -Dm644 $srcdir/LICENSE $pkgdir/usr/share/licenses/java-8-dragonwell-extended/LICENSE
}

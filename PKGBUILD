# Maintainer: plokid <910576949@qq.com>

_java=11
_pkgname=dragonwell
pkgname=jdk$_java-$_pkgname-extended-bin
pkgver=11.0.20.17
_pkgver=11.0.20
__pkgver=11.0.20.17.8
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
source=("LICENSE::https://github.com/dragonwell-project/dragonwell11/raw/master/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/dragonwell-project/dragonwell11/releases/download/dragonwell-extended-${pkgver}_jdk-${_pkgver}-ga/Alibaba_Dragonwell_Extended_${__pkgver}_x64_linux.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/dragonwell-project/dragonwell11/releases/download/dragonwell-extended-${pkgver}_jdk-${_pkgver}-ga/Alibaba_Dragonwell_Extended_${__pkgver}_aarch64_linux.tar.gz")
sha256sums=('4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726')
sha256sums_x86_64=('83f7fb3afe467b2f91c5404dc9d6dee0346d90ae827a3954a897b7e55f3b290b')
sha256sums_aarch64=('2dc7bd1ad96cc9aa2aefb27003851d07b6a9c2940bfab9982fac86b8e5b52b0d')

package() {
	install -d $pkgdir/usr/lib/jvm/java-11-dragonwell-extended
	mv $srcdir/dragonwell-*/* $pkgdir/usr/lib/jvm/java-11-dragonwell-extended
	install -Dm644 LICENSE $pkgdir/usr/share/licenses/java-11-dragonwell-extended/LICENSE
}

# Maintainer: plokid <910576949@qq.com>

_java=8
_pkgname=dragonwell
pkgname=jdk$_java-$_pkgname-extended-bin
pkgver=8.16.17
_pkgver=8u382
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
source=("LICENSE::https://github.com/dragonwell-project/dragonwell8/raw/master/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/alibaba/dragonwell8/releases/download/dragonwell-extended-${pkgver}_jdk${_pkgver}-ga/Alibaba_Dragonwell_Extended_${pkgver}_x64_linux.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/alibaba/dragonwell8/releases/download/dragonwell-extended-${pkgver}_jdk${_pkgver}-ga/Alibaba_Dragonwell_Extended_${pkgver}_aarch64_linux.tar.gz")
sha256sums=('4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726')
sha256sums_x86_64=('fe79b0c2081f894f82396179abb4dac93c6e887df07d1321ca3e5dca596ebea7')
sha256sums_aarch64=('2602b8f707b1a15a628bfdc9396bfdf9906d420172871e64a02a1604871cdc91')

package() {
	install -d $pkgdir/usr/lib/jvm/java-8-dragonwell-extended
	mv $srcdir/dragonwell-$pkgver/* $pkgdir/usr/lib/jvm/java-8-dragonwell-extended
	rm $pkgdir/usr/lib/jvm/java-8-dragonwell-extended/src.zip
	install -Dm644 $srcdir/LICENSE $pkgdir/usr/share/licenses/java-8-dragonwell-extended/LICENSE
}

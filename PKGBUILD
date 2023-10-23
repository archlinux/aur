# Maintainer: plokid <910576949@qq.com>

_java=8
_pkgname=dragonwell
pkgname=jdk$_java-$_pkgname-standard-bin
pkgver=8.16.17
_pkgver=8u382
pkgrel=1
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
sha256sums_x86_64=('18d483c5cc1c16591fce9a84c605275570c5ea325c15a2ecb4e05e7a81956e72')
sha256sums_aarch64=('18f4b12c983a38425de86d6f13b46de0526ee9a19dbdeba3431fad35cb6e7b15')

package() {
	install -d $pkgdir/usr/lib/jvm/java-8-dragonwell-standard
	mv $srcdir/dragonwell-$pkgver/* $pkgdir/usr/lib/jvm/java-8-dragonwell-standard
	rm $pkgdir/usr/lib/jvm/java-8-dragonwell-standard/src.zip
	install -Dm644 $srcdir/LICENSE $pkgdir/usr/share/licenses/java-8-dragonwell-standard/LICENSE
}

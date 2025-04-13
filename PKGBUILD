# Maintainer: gao <gao66 at sdf dot org>

_java=21
_pkgname=dragonwell
pkgname=jdk$_java-$_pkgname-extended-bin
pkgver=21.0.6.0.6
_pkgver=21.0.6.0.6+7
_pkgver_=21.0.6.0.6.7
__pkgver=21.0.6
___pkgver=21
pkgrel=1
pkgdesc="an in-house OpenJDK implementation at Alibaba (Extended Edition)"
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
source=("LICENSE::https://github.com/dragonwell-project/dragonwell${___pkgver}/raw/master/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/dragonwell-project/dragonwell${___pkgver}/releases/download/dragonwell-extended-${_pkgver}_jdk-${__pkgver}-ga/Alibaba_Dragonwell_Extended_${_pkgver_}_x64_linux.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/dragonwell-project/dragonwell${___pkgver}/releases/download/dragonwell-extended-${_pkgver}_jdk-${__pkgver}-ga/Alibaba_Dragonwell_Extended_${_pkgver_}_aarch64_linux.tar.gz")
sha256sums=('4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726')
sha256sums_x86_64=('370f8ce08b23881c5f2418c32e25cfe947d8d9dafdd09ce3432b193cdeeed074')
sha256sums_aarch64=('9845c0f4ca601ecbfe8127a36bf7a9ab28904c300f85bc4a7176c5e8307e860e')

package() {
	install -d $pkgdir/usr/lib/jvm/java-21-dragonwell-extended
	mv $srcdir/dragonwell-$_pkgver-GA/* $pkgdir/usr/lib/jvm/java-21-dragonwell-extended
	install -Dm664 LICENSE $pkgdir/usr/share/licenses/java-21-dragonwell-extended/LISENCE
}

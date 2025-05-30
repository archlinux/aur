# Maintainer: gao <gao66 at sdf dot org>

_java=21
_pkgname=dragonwell
pkgname=jdk$_java-$_pkgname-extended-bin
pkgver=21.0.7.0.7
_pkgver=21.0.7.0.7+6
_pkgver_=21.0.7.0.7.6
__pkgver=21.0.7
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
sha256sums_x86_64=('da1487b2517159d5e54d4fdeebd890a1cb2926a9ba01af9d9e34645bc65456ef')
sha256sums_aarch64=('04f580ecb63f72f8315cd10171cb2c728c3a0400aef0e1010ca5b83912fecb00')

package() {
	install -d $pkgdir/usr/lib/jvm/java-21-dragonwell-extended
	mv $srcdir/dragonwell-$_pkgver-GA/* $pkgdir/usr/lib/jvm/java-21-dragonwell-extended
	install -Dm664 LICENSE $pkgdir/usr/share/licenses/java-21-dragonwell-extended/LISENCE
}

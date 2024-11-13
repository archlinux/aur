# Maintainer: gao <gao66@sdf.org>

_java=21
_pkgname=dragonwell
pkgname=jdk$_java-$_pkgname-extended-bin
pkgver=21.0.4.0.4
_pkgver=21.0.4.0.4+7
_pkgver_=21.0.4.0.4.7
__pkgver=21.0.4
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
sha256sums_x86_64=('1f4386945f6d1b116ccec4b9c8ac898f293c0ec2cae6b7ed58b07eaefec08453')
sha256sums_aarch64=('d8c2fd0cda3c4de8f79b6c96b8687d6edeff52371f69a3c32b0543cda09d9d24')

package() {
	install -d $pkgdir/usr/lib/jvm/java-21-dragonwell-extended
	mv $srcdir/dragonwell-$_pkgver-GA/* $pkgdir/usr/lib/jvm/java-21-dragonwell-extended
	install -Dm664 LICENSE $pkgdir/usr/share/licenses/java-21-dragonwell-extended/LISENCE
}

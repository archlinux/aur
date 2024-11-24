# Maintainer: gao <gao66 at sdf dot org>

_java=21
_pkgname=dragonwell
pkgname=jdk$_java-$_pkgname-standard-bin
pkgver=21.0.5.0.5
_pkgver=21.0.5.0.5+9
_pkgver_=21.0.5.0.5.9
__pkgver=21.0.5
___pkgver=21
pkgrel=2
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
source=("LICENSE::https://github.com/dragonwell-project/dragonwell${___pkgver}/raw/master/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/dragonwell-project/dragonwell${___pkgver}/releases/download/dragonwell-standard-${_pkgver}_jdk-${__pkgver}-ga/Alibaba_Dragonwell_Standard_${_pkgver_}_x64_linux.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/dragonwell-project/dragonwell${___pkgver}/releases/download/dragonwell-standard-${_pkgver}_jdk-${__pkgver}-ga/Alibaba_Dragonwell_Standard_${_pkgver_}_aarch64_linux.tar.gz")
sha256sums=('4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726')
sha256sums_x86_64=('7b51d0f2ec8c2096741dda160c61b047a6fd47c9a554fdfdd961f9745523f0ee')
sha256sums_aarch64=('3cb2ab86b9bfc132e754a198d2893c5b880039377cb84b50090bb22c525a0924')

package() {
	install -d $pkgdir/usr/lib/jvm/java-21-dragonwell-standard
	mv $srcdir/dragonwell-$_pkgver-GA/* $pkgdir/usr/lib/jvm/java-21-dragonwell-standard
	install -Dm664 LICENSE $pkgdir/usr/share/licenses/java-21-dragonwell-standard/LISENCE
}

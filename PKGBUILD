# Maintainer: Rasmus Moorats <xx+aur@nns.ee>
# Maintainer: w568w <w568w at outlook dot com>
_java=17
_java_minor=+7.1
pkgname="jdk${_java}-graalvm-ee-bin"
pkgver=17.0.20
pkgrel=1
pkgdesc="Universal virtual machine for running applications written in a variety of languages (JVM-based, LLVM-based, or other), Java ${_java} version"
arch=('x86_64'
	'aarch64')
url='https://www.graalvm.org/'
license=('LicenseRef-OTN')
depends=('java-runtime-common'
	'java-environment-common')
makedepends=()
provides=("java-runtime=${_java}"
	"java-environment=${_java}"
	"java-environment-openjdk=${_java}")
options=('staticlibs'
	'!debug')
install="$pkgname.install"
sha256sums_x86_64=('00fc8f0cd7b58a3aaf0ca54fc3d311b0ef33229c3d9f5f6954f78828c7b12647')
sha256sums_aarch64=('cce4340efe5d904fa861379ca26d73a8f7836778d916b4f2c78ac0f8406c2d58')
source_x86_64=("https://archive.org/download/oracle-graalvm-jdk-${_java}/graalvm-jdk-${pkgver}_linux-x64_bin.tar.gz")
source_aarch64=("https://archive.org/download/oracle-graalvm-jdk-${_java}/graalvm-jdk-${pkgver}_linux-aarch64_bin.tar.gz")
package() {
	cd "graalvm-jdk-${pkgver}${_java_minor}"
	mkdir -p "$pkgdir/usr/lib/jvm/java-${_java}-graalvm-ee/"
	cp -a -t "$pkgdir/usr/lib/jvm/java-${_java}-graalvm-ee/" ./*
	install -DTm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

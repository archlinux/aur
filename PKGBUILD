# Maintainer: Rasmus Moorats <xx+aur@nns.ee>
# Maintainer: w568w <w568w at outlook dot com>
_java=17
_java_minor=+4.1
pkgname="jdk${_java}-graalvm-ee-bin"
pkgver=17.0.21.1
pkgrel=1
pkgdesc="Universal virtual machine for running applications written in a variety of languages (JVM-based, LLVM-based, or other), Java ${_java} version"
arch=('x86_64'
	'aarch64')
url='https://www.graalvm.org/'
license=('LicenseRef-OTN')
depends=('java-runtime-common'
	'java-environment-common'
	'freetype2'
	'libx11'
	'libxext'
	'libxi'
	'libxrender'
	'libxtst'
	'alsa-lib'
	'python')
makedepends=()
provides=("java-runtime=${_java}"
	"java-environment=${_java}"
	"java-environment-openjdk=${_java}")
options=('staticlibs'
	'!debug')
install="$pkgname.install"
sha256sums_x86_64=('046d83884a00d318b78051fe7b889068acb46606d428afa2c2b52d11cb6aac62')
sha256sums_aarch64=('da4bbc639c4b264bb256ae0baeff67b61b3633f6e43f1d06923e0b55a09409dc')
source_x86_64=("https://archive.org/download/oracle-graalvm-jdk-${_java}/graalvm-jdk-${pkgver}_linux-x64_bin.tar.gz")
source_aarch64=("https://archive.org/download/oracle-graalvm-jdk-${_java}/graalvm-jdk-${pkgver}_linux-aarch64_bin.tar.gz")
package() {
	cd "graalvm-jdk-${pkgver}${_java_minor}"
	mkdir -p "$pkgdir/usr/lib/jvm/java-${_java}-graalvm-ee/"
	cp -a -t "$pkgdir/usr/lib/jvm/java-${_java}-graalvm-ee/" ./*
	install -DTm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

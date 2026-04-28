# Maintainer: Rasmus Moorats <xx+aur@nns.ee>
# Maintainer: w568w <w568w at outlook dot com>
_java=17
_java_minor=+9.1
pkgname="jdk${_java}-graalvm-ee-bin"
pkgver=17.0.19
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
sha256sums_x86_64=('f754a3c0a7e36eab2896c653b175dd4b419128d7d2ebe0e4ab2e5c4941ac3d87')
sha256sums_aarch64=('276e04833678456d85f8d389bbe1a1dfcf4a5dac8f2b27fbbafdd14af599a894')
source_x86_64=("https://archive.org/download/oracle-graalvm-jdk-${_java}/graalvm-jdk-${pkgver}_linux-x64_bin.tar.gz")
source_aarch64=("https://archive.org/download/oracle-graalvm-jdk-${_java}/graalvm-jdk-${pkgver}_linux-aarch64_bin.tar.gz")
package() {
	cd "graalvm-jdk-${pkgver}${_java_minor}"
	mkdir -p "$pkgdir/usr/lib/jvm/java-${_java}-graalvm-ee/"
	cp -a -t "$pkgdir/usr/lib/jvm/java-${_java}-graalvm-ee/" ./*
	install -DTm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

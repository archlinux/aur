# Maintainer: Rasmus Moorats <xx+aur@nns.ee>
# Maintainer: w568w <w568w at outlook dot com>
_java=17
_java_minor=+8.1
pkgname="jdk${_java}-graalvm-ee-bin"
pkgver=17.0.18
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
sha256sums_x86_64=('4f4886aeafab53cb8a153a6dd0d2d1bbb1bf0e8d2df5d78e77265c85e3bb5e95')
sha256sums_aarch64=('f9ca9a4a2d5b2ba8afd53abc876df2d01c8e540331233322506e5c5e81e0234d')
source_x86_64=("https://archive.org/download/oracle-graalvm-jdk-${_java}/graalvm-jdk-${pkgver}_linux-x64_bin.tar.gz")
source_aarch64=("https://archive.org/download/oracle-graalvm-jdk-${_java}/graalvm-jdk-${pkgver}_linux-aarch64_bin.tar.gz")
package() {
	cd "graalvm-jdk-${pkgver}${_java_minor}"
	mkdir -p "$pkgdir/usr/lib/jvm/java-${_java}-graalvm-ee/"
	cp -a -t "$pkgdir/usr/lib/jvm/java-${_java}-graalvm-ee/" ./*
	install -DTm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

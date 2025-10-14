# Maintainer: zoeyrae <zoey.ronain at gmail dot com>
# Contributor: Rasmus Moorats <xx+aur@nns.ee>
_java=21
_java_minor=12.1
pkgname="jdk${_java}-graalvm-ee-bin"
pkgver=21.0.8
pkgrel=1
pkgdesc="Universal virtual machine for running applications written in a variety of languages (JVM-based, LLVM-based, or other), Java ${_java} version"
arch=('x86_64'
	'aarch64')
url='https://www.graalvm.org/'
license=('LicenseRef-GFTC')
depends=('java-runtime-common'
	'java-environment-common')
makedepends=()
provides=("java-runtime=${_java}"
	"java-environment=${_java}"
	"java-environment-openjdk=${_java}")
options=('staticlibs'
	'!debug')
install="$pkgname.install"
sha256sums_x86_64=('c8035b3ce6e45f1481752c6b38153bb4a53eeb477c5345d5bec5ca44ed18a056')
sha256sums_aarch64=('aa1100beb3377717a0ba1937e51878c48917615922a36c4508baf46927a9a6e4')
source_x86_64=("https://download.oracle.com/graalvm/${_java}/archive/graalvm-jdk-${pkgver}_linux-x64_bin.tar.gz")
source_aarch64=("https://download.oracle.com/graalvm/${_java}/archive/graalvm-jdk-${pkgver}_linux-aarch64_bin.tar.gz")

package() {
	cd "graalvm-jdk-${pkgver}+${_java_minor}"
	mkdir -p "$pkgdir/usr/lib/jvm/java-${_java}-graalvm-ee/"
	cp -a -t "$pkgdir/usr/lib/jvm/java-${_java}-graalvm-ee/" *
	install -DTm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

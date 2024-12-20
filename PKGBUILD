# Maintainer: Madeline Mewmews <maddie at mewmews dot gay>
# Contributor: Rasmus Moorats <xx+aur@nns.ee>

_java=23
_java_minor=+11.1
pkgname="jdk${_java}-graalvm-ee-bin"
pkgver=23.0.1
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
	"java-environment=${_java}")
options=('staticlibs'
	'!debug')
install="$pkgname.install"
sha256sums_x86_64=('46ec9582ebe114f93470403f2cc123238ac0c7982129c358af7d8e1de52dd663')
sha256sums_aarch64=('1835a98b87c439c8c654d97956c22d409855952e5560a8127f56c50f3f919d7d')
source_x86_64=("https://download.oracle.com/graalvm/${_java}/latest/graalvm-jdk-${_java}_linux-x64_bin.tar.gz")
source_aarch64=("https://download.oracle.com/graalvm/${_java}/latest/graalvm-jdk-${_java}_linux-aarch64_bin.tar.gz")

package() {
	cd "graalvm-jdk-${pkgver}${_java_minor}"
	mkdir -p "$pkgdir/usr/lib/jvm/java-${_java}-graalvm-ee/"
	cp -a -t "$pkgdir/usr/lib/jvm/java-${_java}-graalvm-ee/" *
	install -DTm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

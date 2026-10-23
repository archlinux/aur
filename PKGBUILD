# Maintainer: zoeyrae <zoey.ronain at gmail dot com>
# Contributor: Rasmus Moorats <xx+aur@nns.ee>
_java=21
_java_minor=0.13
pkgname="jdk${_java}-graalvm-ee-bin"
pkgver=21.0.13
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
sha256sums_x86_64=('b007ff64c425f85bbe0e686107044fba6ca5054a7e89271a473767f546aaddc1')
sha256sums_aarch64=('e37877e3a67cd5c7be6172e8e26ecae7e5b4c76dd78f1d34f880cb7b985ebfd8')
source_x86_64=("https://download.oracle.com/graalvm/21/latest/graalvm-jdk-21_linux-x64_bin.tar.gz")
source_aarch64=("https://download.oracle.com/graalvm/21/latest/graalvm-jdk-21_linux-aarch64_bin.tar.gz")

package() {
	cd "graalvm-jdk-${pkgver}+${_java_minor}"
	mkdir -p "$pkgdir/usr/lib/jvm/java-${_java}-graalvm-ee/"
	cp -a -t "$pkgdir/usr/lib/jvm/java-${_java}-graalvm-ee/" *
	install -DTm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

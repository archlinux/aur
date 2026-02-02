# Maintainer: zoeyrae <zoey.ronain at gmail dot com>
# Contributor: Rasmus Moorats <xx+aur@nns.ee>
_java=21
_java_minor=8.1
pkgname="jdk${_java}-graalvm-ee-bin"
pkgver=21.0.10
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
sha256sums_x86_64=('5607d35ad56ca484030667e885e3170b43c879754f218f463f94e791b747b7fd')
sha256sums_aarch64=('c63f98f0bc9825382d1334beffef6eda97dff41e8cd3bcb0972b0ad5f1e48944')
source_x86_64=("https://download.oracle.com/graalvm/${_java}/archive/graalvm-jdk-${pkgver}_linux-x64_bin.tar.gz")
source_aarch64=("https://download.oracle.com/graalvm/${_java}/archive/graalvm-jdk-${pkgver}_linux-aarch64_bin.tar.gz")

package() {
	cd "graalvm-jdk-${pkgver}+${_java_minor}"
	mkdir -p "$pkgdir/usr/lib/jvm/java-${_java}-graalvm-ee/"
	cp -a -t "$pkgdir/usr/lib/jvm/java-${_java}-graalvm-ee/" *
	install -DTm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

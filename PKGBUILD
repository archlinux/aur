# Maintainer: Madeline Mewmews <maddie at mewmews dot gay>
# Contributor: Rasmus Moorats <xx+aur@nns.ee>

_java=24
_java_minor=+11.1
pkgname="jdk${_java}-graalvm-ee-bin"
pkgver=24.0.2
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
sha256sums_x86_64=('b0161a49bbc1d0f40697532ddfabb8052a5a15e463775e6945fe3e4920259bae')
sha256sums_aarch64=('76f2557f32e8cfbe6d8b7bbf331f0f092ebbe1cc36a2678e098305892076298b')
source_x86_64=("https://download.oracle.com/graalvm/${_java}/archive/graalvm-jdk-${pkgver}_linux-x64_bin.tar.gz")
source_aarch64=("https://download.oracle.com/graalvm/${_java}/archive/graalvm-jdk-${pkgver}_linux-aarch64_bin.tar.gz")

package() {
	cd "graalvm-jdk-${pkgver}${_java_minor}"
	mkdir -p "$pkgdir/usr/lib/jvm/java-${_java}-graalvm-ee/"
	cp -a -t "$pkgdir/usr/lib/jvm/java-${_java}-graalvm-ee/" *
	install -DTm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

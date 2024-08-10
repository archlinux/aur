# Maintainer: James R Larrowe <rot13 yneebjr.frznw11@tznvy.pbz>

_java=24
_java_minor=+8.1
_java_eaver=07
pkgname="jdk${_java}-graalvm-ea-bin"
pkgver=24.0.0
pkgrel=1
pkgdesc="Universal virtual machine for running applications written in a variety of languages (JVM-based, LLVM-based, or other), Java ${_java} early access"
arch=('x86_64')
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
sha256sums_x86_64=('85ee77e0b9ceb07750ea338b89cf21dc82b378aeb84b378f78bf3c46c97383b7')
source_x86_64=("https://github.com/graalvm/oracle-graalvm-ea-builds/releases/download/jdk-${pkgver}-ea.${_java_eaver}/graalvm-jdk-${pkgver}-ea.${_java_eaver}_linux-x64_bin.tar.gz")

package() {
	cd "graalvm-jdk-${_java}${_java_minor}"
	mkdir -p "$pkgdir/usr/lib/jvm/java-${_java}-graalvm-ea/"
	cp -a -t "$pkgdir/usr/lib/jvm/java-${_java}-graalvm-ea/" *
	install -DTm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

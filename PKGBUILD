# Maintainer: JL2210 <rot13 yneebjr.frznw11@tznvy.pbz>

_java=24
_java_minor=+10.1
pkgname="jdk24-graalvm-ea-bin"
pkgver=24.0.0_ea.08
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
sha256sums_x86_64=('74fe1a091ba87e6e6639d413df57e2600167e83eb973ab0c2793c908a01f95e8'
                   'eae06c1b4e8b19a918a049b42fcbacb6d416c4da559d6da65dd2046d5838472d')
source_x86_64=("https://github.com/graalvm/oracle-graalvm-ea-builds/releases/download/jdk-${pkgver//_/-}/graalvm-jdk-${pkgver//_/-}_linux-x64_bin.tar.gz"
               "$install")

package() {
	cd "graalvm-jdk-${_java}${_java_minor}"
	mkdir -p "$pkgdir/usr/lib/jvm/java-${_java}-graalvm-ea/"
	cp -a -t "$pkgdir/usr/lib/jvm/java-${_java}-graalvm-ea/" *
	install -DTm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
